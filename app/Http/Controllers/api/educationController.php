<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\m_education;
use Validator;

class educationController extends Controller
{
    
    public function index()
    {
        $listEducation = DB::table('education')
                   ->join('employee','employee.id','=','education.employee_id')
                   ->select('education.*','employee.name as name_employee')
                   ->get();

        return response([
            'message' => 'data education',
            'data' => $listEducation
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
		    'name' => 'required',
		    'level' => 'required',
            'description' => 'required',
		    'created_by' => 'required',
            'updated_by' => 'required',
		]);

        
        $insertEducation = DB::table('education')->insert([
            'employee_id' =>$request->employee_id,
            'name' =>$request->name,
            'level' =>$request->level,
            'description' =>$request->description,
            'created_by' => $request->created_by,
            'updated_by' => $request->updated_by,
        ]);

        return response()->json([
            'message' => 'data education berhasil ditambah',
            'insert_education' =>  $insertEducation
        ], 200);


    }

   
    public function show($id)
    {
        $dataEducation = m_education::find($id);
        //$dataEducation = DB::table('education')->where('id',$id)->get();
       
        if($dataEducation){
            return response()->json([
                'status' => true,
                'message' => 'data ditemukan',
                'data' => $dataEducation
               ], 200);
        }else{
            return response()->json([
                "status" => false,
                "message" => "data tidak ditemukan",
                'data' => $dataEducation
               ], 404);
        }
    }

   
    public function edit($id)
    {
        //
    }

    
    public function update(Request $request, $id)
    {
        $rules = [
            'employee_id' => 'required',
		    'name' => 'required',
		    'level' => 'required',
            'description' => 'required',
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

         $dataEducation = DB::table('education')
                     ->where('id','=',$id)
                     ->update([
                        'employee_id' =>$request->employee_id,
                        'name' =>$request->name,
                        'level' =>$request->level,
                        'description' =>$request->description,
                        'created_by' => $request->created_by,
                        'updated_by' => $request->updated_by,
                     ]);
             if(empty($dataEducation)){
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
        $dataEducation = DB::table('education')->where('id',$id)->delete();
        if(empty($dataEducation)){
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
