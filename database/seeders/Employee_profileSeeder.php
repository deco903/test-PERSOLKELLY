<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\m_employeeProfile;

class Employee_profileSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        m_employeeProfile::create([
           'employee_id' => 2,
           'place_of_birth' => 'sukabumi',
           'date_of_birth' => '1996-05-02',
           'gender' => 'laki-laki',
           'is_married' => FALSE,
           'prof_pic' => ' ',
           'created_by' => 'admin',
           'updated_by' => 'admin'
        ]);
    }
}
