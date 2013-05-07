include:
    - requirements
	
/var/www/app:
    virtualenv.managed:
        - no_site_packages: True
        - requirements: /var/www/app/requirements.txt
        - require:
            - pkg: python-virtualenv