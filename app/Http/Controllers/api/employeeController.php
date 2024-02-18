<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\m_employee;
use Validator;

class employeeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $listemployee = DB::table('employee')->get();

        return response()->json([
            'message' => 'data employe',
            'data' => $listemployee
        ], 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function all()
    {
         
        $allEmploye = DB::table('employee')
                   ->join('employee_profile','employee.id','=','employee_profile.employee_id')
                   ->join('education','employee.id','=','education.employee_id')
                   ->select('employee.*','employee_profile.gender',
                            'employee_profile.date_of_birth as usia',
                            'education.name as school_name',
                            'education.level')
                   ->get();
            
        return response()->json([
            'message' => 'data employe',
            'data' => $allEmploye
        ], 200);

    }


    public function store(Request $request)
    {
        
    	$request->validate([
		    'nik' => 'required',
		    'name' => 'required',
		    'is_active' => 'required',
            'start_date' => 'required',
		    'end_date' => 'required',
		    'created_by' => 'required',
            'updated_by' => 'required',
		]);


        $insertEmployee = DB::table('employee')->insert([
            'nik' =>$request->nik,
            'name' =>$request->name,
            'is_active' =>$request->is_active,
            'start_date' =>$request->start_date,
            'end_date' =>$request->end_date,
            'created_by' => $request->created_by,
            'updated_by' => $request->updated_by,
            ]);

        // $insertEmployee = new m_employee;
    	// $insertEmployee->nik = $request->nik;
        // $insertEmployee->nama = $request->nama;
    	// $insertEmployee->is_active = $request->is_active;
    	// $insertEmployee->start_date = $request->start_date;
        // $insertEmployee->end_date = $request->end_date;
        // $insertEmployee->created_by = Auth::user()->id;
        // $insertEmployee->updated_by = Auth::user()->id;
    	// $insertEmployee->save();

            return response()->json([
            'message' => 'data employee berhasil ditambah',
            'insert_employee' =>  $insertEmployee
            ], 200);
         //dd($request->all());


    }

   
    public function show($id)
    {
        //$data = m_buku::findOrFail($id);
        $dataEmployee = DB::table('employee')->where('id',$id)->get();
       
        if($dataEmployee){
            return response()->json([
                'status' => true,
                'message' => 'data ditemukan',
                'data' => $dataEmployee
               ], 200);
        }else{
            return response()->json([
                "status" => false,
                "message" => "data tidak ditemukan"  
               ]);
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
            'nik' => 'required',
		    'name' => 'required',
		    'is_active' => 'required',
            'start_date' => 'required',
		    'end_date' => 'required',
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

         $dataEmployee = DB::table('employee')
                     ->where('id','=',$id)
                     ->update([
                        'nik' =>$request->nik,
                        'name' =>$request->name,
                        'is_active' =>$request->is_active,
                        'start_date' =>$request->start_date,
                        'end_date' =>$request->end_date,
                        'created_by' => $request->created_by,
                        'updated_by' => $request->updated_by,
                     ]);
             if(empty($dataEmployee)){
                return response()->json([
                    'status' => false,
                    'message' => 'data tidak ditemukan'
                ], 404);
             }        

        return response()->json([
            'status' => true,
            'message' => 'data berhasil update'
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $dataEmployee = DB::table('employee')->where('id',$id)->delete();
        if(empty($dataEmployee)){
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
