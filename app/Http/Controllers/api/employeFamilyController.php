<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Validator;
use App\Models\m_employeeFamily;

class employeFamilyController extends Controller
{
    
    public function index()
    {
        $listEmployeeFamily = DB::table('employee_family')
                        ->join('employee','employee.id','=','employee_family.employee_id')
                        ->select('employee_family.*','employee.name as name_employee')
                        ->get();

        return response([
        'message' => 'data education',
        'data' => $listEmployeeFamily
        ], 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //dd($request->all());
        $request->validate([
		    'employee_id' => 'required',
		    'name' => 'required',
		    'identifier' => 'required',
            'job' => 'required',
            'place_of_birth' => 'required',
            'date_of_birth' => 'required',
            'religion' => 'required',
            'is_life' => 'required',
            'is_divorced' => 'required',
            'relation_status' => 'required',
		    'created_by' => 'required',
            'updated_by' => 'required',
		]);

        
        $insertEmpployeeFamily = DB::table('employee_family')->insert([
            'employee_id' => $request->employee_id,
		    'name' => $request->name,
		    'identifier' => $request->identifier,
            'job' => $request->job,
            'place_of_birth' => $request->place_of_birth,
            'date_of_birth' => $request->date_of_birth,
            'religion' => $request->religion,
            'is_life' => $request->is_life,
            'is_divorced' => $request->is_divorced,
            'relation_status' => $request->relation_status,
		    'created_by' => $request->created_by,
            'updated_by' => $request->updated_by,
        ]);

        return response()->json([
            'message' => 'data employee family berhasil ditambah',
            'insert_employee_family' =>  $insertEmpployeeFamily
        ], 200);

    }

   
    public function show(string $id)
    {
         //$data = m_buku::findOrFail($id);
        //$dataEmployeeFamily = DB::table('employee_family')->where($id)->get();
       
         $dataEmployeeFamily = m_employeeFamily::find($id);

         if($dataEmployeeFamily){
             return response()->json([
                 'status' => true,
                 'message' => 'data ditemukan',
                 'data' => $dataEmployeeFamily
                ], 200);
         }else{
             return response()->json([
                 "status" => false,
                 "message" => "data tidak ditemukan",
                 'data' => $dataEmployeeFamily
                ], 404);
         }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $rules = [
            'employee_id' => 'required',
		    'name' => 'required',
		    'identifier' => 'required',
            'job' => 'required',
            'place_of_birth' => 'required',
            'date_of_birth' => 'required',
            'religion' => 'required',
            'is_life' => 'required',
            'is_divorced' => 'required',
            'relation_status' => 'required',
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

         $dataEmployeeFamily = DB::table('employee_family')
                     ->where('id','=',$id)
                     ->update([
                        'employee_id' => $request->employee_id,
                        'name' => $request->name,
                        'identifier' => $request->identifier,
                        'job' => $request->job,
                        'place_of_birth' => $request->place_of_birth,
                        'date_of_birth' => $request->date_of_birth,
                        'religion' => $request->religion,
                        'is_life' => $request->is_life,
                        'is_divorced' => $request->is_divorced,
                        'relation_status' => $request->relation_status,
                        'created_by' => $request->created_by,
                        'updated_by' => $request->updated_by,
                     ]);
             if(empty($dataEmployeeFamily)){
                return response()->json([
                    'status' => false,
                    'message' => 'data tidak ditemukan'
                ], 404);
             }        

        return response()->json([
            'status' => true,
            'message' => 'data berhasil update',
            'data' => $dataEmployeeFamily
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $dataEmployeFamily = DB::table('employee_family')->where('id',$id)->delete();
        if(empty($dataEmployeFamily)){
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
