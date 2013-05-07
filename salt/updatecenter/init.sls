include:
  - requirements

app-pkgs:
  pkg.installed:
    - names:
      - git
      - python-virtualenv
      - python-dev

webapp:
  git.latest:
    - name: {{ pillar['git_repo'] }}
    - rev: {{ pillar['git_rev'] }}
    - target: /var/www/app/
    - force: true
    - require:
      - pkg: app-pkgs
      - file: deploykey
      - file: publickey
      - file: ssh_config
      - pkg: nginx
      - pkg: supervisor

/var/www/venv:
  virtualenv.managed:
    - no_site_packages: True
      - requirements: /var/www/app/requirements.txt
      clear: false
      - require:
        - pkg: app-pkgs

