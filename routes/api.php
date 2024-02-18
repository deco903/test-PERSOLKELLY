<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\api\employeeController;
use App\Http\Controllers\api\educationController;
use App\Http\Controllers\api\employeFamilyController;
use App\Http\Controllers\api\employeeProfileController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

//employee
Route::get('data-employee', [employeeController::class, 'index']);
Route::post('data-employee', [employeeController::class, 'store']);
Route::get('data-employee/{id}', [employeeController::class, 'show']);
Route::put('data-employee/{id}', [employeeController::class, 'update']);
Route::delete('data-employee/{id}', [employeeController::class, 'destroy']);
Route::get('all-employee', [employeeController::class, 'all']);


//education
Route::get('data-education', [educationController::class, 'index']);
Route::post('data-education', [educationController::class, 'store']);
Route::get('data-education/{id}', [educationController::class, 'show']);
Route::put('data-education/{id}', [educationController::class, 'update']);
Route::delete('data-education/{id}', [educationController::class, 'destroy']);

//employe family
Route::get('data-employeefamily', [employeFamilyController::class, 'index']);
Route::post('data-employeefamily', [employeFamilyController::class, 'store']);
Route::get('data-employeefamily/{id}', [employeFamilyController::class, 'show']);
Route::put('data-employeefamily/{id}', [employeFamilyController::class, 'update']);
Route::delete('data-employeefamily/{id}', [employeFamilyController::class, 'destroy']);

//employe profile
Route::get('data-employeeprofile', [employeeProfileController::class, 'index']);
Route::post('data-employeeprofile', [employeeProfileController::class, 'store']);
Route::get('data-employeeprofile/{id}', [employeeProfileController::class, 'show']);
Route::put('data-employeeprofile/{id}', [employeeProfileController::class, 'update']);
Route::delete('data-employeeprofile/{id}', [employeeProfileController::class, 'destroy']);