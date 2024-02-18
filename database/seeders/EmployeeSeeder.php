<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\m_employee;

class EmployeeSeeder extends Seeder
{
   
    public function run()
    {
        m_employee::create([
            'nik' => '11014',
            'name' => 'jajang',
            'is_active' => TRUE,
            'start_date' => '2021-09-01',
            'end_date' => '2028-09-01',
            'created_by' => 'admin',
            'updated_by' => 'admin',
        ]);
    }
}
