<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class m_employee extends Model
{
    use HasFactory;
    protected $table = 'employee';
    protected $fillable = [
        'nik',
        'name',
        'is_active',
        'start_date',
        'end_date',
        'created_by',
        'updated_by'
    ];

}
