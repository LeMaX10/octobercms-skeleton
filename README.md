# October skeleton for development

This skeleton is based on laravel-sail has packages for compliance with PSR-12 standards, as well as auxiliary packages for standard control.
The main purpose of the project is to quickly deploy and configure the development environment and the system itself.

### Includes:
1. OctoberCMS 1.1 (Based on Laravel 6)
2. Laravel-Sail (fork https://github.com/LeMaX10/sail)
3. fakerphp/faker
4. GrumPHP
5. PHPUnit
6. PHP CS Fixer 2
7. PHPMND

### Required:
1. Composer 1/2
2. PHP 7.4
3. Docker
4. Docker-compose
5. git

## Installation
1. Clone project:
```bash
git clone https://github.com/LeMaX10/octobercms-skeleton.git .
```

2. Setup project

To set up the project, you need to change the key variables {author}, {projectName} in the configuration files.
For this purpose, a build.sh file has been created that allows you to do this in Linux systems.
You must call the build.sh and pass it the author's alias and the project name as parameters:

Example:
```bash
chmod +x build.sh && ./build.sh lemax10 example-project
```

The script will configure the project, as well as create a directory for the developer plugins/{author} and clone the standard demo OctoberCMS theme

3. Install composer dependency
```bash
composer install --no-scripts
```

4. Run sail project
```bash
vendor/bin/sail up -d
```

5. Generate APP_KEY
```bash
APP_KEY=$(vendor/bin/sail artisan key:generate --no-ansi --show) sed -i -e "s/APP_KEY=/APP_KEY=${APP_KEY}/g" .env
```

6. Restart and install october
```bash
vendor/bin/sail restart && vendor/bin/sail artisan october:up
```

Password administrator show from complete install.
