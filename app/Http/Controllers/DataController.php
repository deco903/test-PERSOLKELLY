<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use DateTime;



class DataController extends Controller
{
    public function index()
    {
        
        // $listData = DB::table('employee')
        //            ->join('employee_profile','employee.id','=','employee_profile.employee_id')
        //            ->join('education','employee.id','=','education.employee_id')
        //            ->select('employee.*','employee_profile.gender',
        //                     'employee_profile.date_of_birth as usia',
        //                     'education.name as school_name',
        //                     'education.level')
        //            ->get();

        $listData = DB::table('employee')
                   ->join('employee_profile','employee.id','=','employee_profile.employee_id')
                   ->join('education','employee.id','=','education.employee_id')
                   ->select('employee.*','employee_profile.gender',
                            'employee_profile.date_of_birth as usia',
                            'education.name as school_name',
                            'education.level')
                   ->get();

                $listData->map(function($item){
                    $listData['school_name'] = $item->school_name;

                    $listData['level'] = $item->level;
                    $listData['gender'] = $item->gender;

                    $date = new DateTime($item->usia);
                    $now = new DateTime();
                    $interval = $now->diff($date);

                    $listData['umur'] = $interval->y;
                });

                   
        return view('query',['listData' => $listData]);
    }
}
