<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\m_employeeFamily;


class Employee_familySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        m_employeeFamily::create([
            'employee_id' => 3,
            'name' => 'stephanie',
            'identifier' => '32100594109020005',
            'job' => 'pelajar',
            'place_of_birth' => 'bangkalan',
            'date_of_birth' => '2008-10-17',
            'religion' => 'islam',
            'is_life' => TRUE,
            'is_divorced' => FALSE,
            'relation_status' => 'anak',
            'created_by' => 'admin',
            'updated_by' => 'admin'
         ]);
    }
}
