<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Validator;
use App\Models\m_employeeProfile;


class employeeProfileController extends Controller
{
    
    public function index()
    {
        $listEmployeeProfile = DB::table('employee_profile')
                            ->join('employee','employee.id','=','employee_profile.employee_id')
                            ->select('employee_profile.*','employee.name as name_employee')
                            ->get();

        return response([
        'message' => 'data education',
        'data' => $listEmployeeProfile
        ], 200);
    }

   
    public function create()
    {
        //
    }

    
    public function store(Request $request)
    {
        //dd($request->all());
        $request->validate([
		    'employee_id' => 'required',
            'place_of_birth' => 'required',
            'date_of_birth' => 'required',
            'gender' => 'required',
            'is_married' => 'required',
            'prof_pic' => 'required',
		    'created_by' => 'required',
            'updated_by' => 'required',
		]);

        
        $insertEmpployeeProfile = DB::table('employee_profile')->insert([
            'employee_id' => $request->employee_id,
            'place_of_birth' => $request->place_of_birth,
            'date_of_birth' => $request->date_of_birth,
            'gender' => $request->gender,
            'is_married' => $request->is_married,
            'prof_pic' => $request->prof_pic,
		    'created_by' => $request->created_by,
            'updated_by' => $request->updated_by,
        ]);

        return response()->json([
            'message' => 'data employee profile berhasil ditambah',
            'insert_employee_profile' =>  $insertEmpployeeProfile
        ], 200);

    }

    public function edit($id)
    {
        //
    }

    public function show($id)
    {
        $dataEmployeeProfile = m_employeeProfile::find($id);

        if($dataEmployeeProfile){
            return response()->json([
                'status' => true,
                'message' => 'data ditemukan',
                'data' => $dataEmployeeProfile
               ], 200);
        }else{
            return response()->json([
                "status" => false,
                "message" => "data tidak ditemukan",
                'data' => $dataEmployeeProfile
               ], 404);
        }
    }

    public function update(Request $request, $id)
    {
        $rules = [
            'employee_id' => 'required',
            'place_of_birth' => 'required',
            'date_of_birth' => 'required',
            'gender' => 'required',
            'is_married' => 'required',
            'prof_pic' => 'required',
		    'created_by' => 'required',
            'updated_by' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                'status' => false,
                'message' => 'gagal melakukan update data',
                'date' => $validator->errors()
            ]);
        };

         $dataEmployeeProfile = DB::table('employee_profile')
                     ->where('id','=',$id)
                     ->update([
                        'employee_id' => $request->employee_id,
                        'place_of_birth' => $request->place_of_birth,
                        'date_of_birth' => $request->date_of_birth,
                        'gender' => $request->gender,
                        'is_married' => $request->is_married,
                        'prof_pic' => $request->prof_pic,
                        'created_by' => $request->created_by,
                        'updated_by' => $request->updated_by,
                     ]);
             if(empty($dataEmployeeProfile)){
                return response()->json([
                    'status' => false,
                    'message' => 'data tidak ditemukan'
                ], 404);
             }        

        return response()->json([
            'status' => true,
            'message' => 'data berhasil update',
            'data' => $dataEmployeeProfile
        ], 200);
    }

  
    public function destroy($id)
    {
        $dataEmployeProfile = DB::table('employee_profile')->where('id',$id)->delete();
        
        if(empty($dataEmployeProfile)){
            return response()->json([
                'status' => false,
                'message' => 'data tidak ditemukan'
            ], 404);
         }        
            
         return response()->json([
            'status' => true,
            'message' => 'data berhasil dihapus'
        ]);
    }
}
