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
      - file: publickey
      - pkg: nginx
      - pkg: supervisor

/var/www/venv:
  virtualenv.manage:
    - requirements: /var/www/app/requirements.txt
    - no_site_packages: True
    - clear: false
    - require:
      - pkg: app-pkgs

