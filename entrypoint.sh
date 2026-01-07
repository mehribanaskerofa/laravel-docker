#!/bin/bash

# Laravel cache-lərini təmizləyirik
php artisan optimize:clear

# Verilənlər bazasında lazımi cədvəllərin yaradılması üçün migrate əmri işə salınır
php artisan migrate --force

# Laravel konfiqurasiyasını təmizləyirik
php artisan config:clear

# Laravel cache-i təmizləyirik
php artisan cache:clear

# Laravel serverini işə salırıq
php artisan serve --host=0.0.0.0 --port=8080
