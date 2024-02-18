<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\m_education;

class EducationSeeder extends Seeder
{
   
    public function run()
    {
        
        m_education::create([
           'employee_id' => 2,
           'name' => 'universitas negeri jakarta',
           'level' => 'strata-1',
           'description' => 'sarjana',
           'created_by' => 'admin',
           'updated_by' => 'admin'
        ]);
    }
}
