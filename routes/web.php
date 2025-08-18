<?php

use Illuminate\Support\Facades\Route;
use Filament\Facades\Filament;


Route::get('/', function () {
    return redirect()->route('filament.admin.auth.login');
});