<?php

use Illuminate\Support\Facades\Route;
use Filament\Facades\Filament;
use Illuminate\Support\Facades\Artisan;


Route::get('/', function () {
    return redirect('/admin/login');
});

Route::get('/clear-cache-temp', function () {
    Artisan::call('optimize:clear');
    return '✅ Cache cleared';
});