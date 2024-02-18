<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class m_employeeProfile extends Model
{
    use HasFactory;
    protected $table = 'employee_profile';
    protected $fillable = [
        'employee_id',
        'place_of_birth',
        'date_of_birth',
        'gender',
        'is_married',
        'prof_pic',
        'created_by',
        'updated_by'

    ];

    public function m_employee(): BelongsTo
    {
        return $this->belongsTo(m_employee::class,'employee_id', 'id');
    }
}
