<html>
    <head></head>
    <body>
    <table class="table" border="1">
        <thead>
            <tr>
            <th scope="col">employe id</th>
            <th scope="col">NIK</th>
            <th scope="col">name</th>
            <th scope="col">is active</th>
            <th scope="col">gender</th>
            <th scope="col">age</th>
            <th scope="col">schoole name</th>
            <th scope="col">level</th>
            <th scope="col">family data</th>
            </tr>
        </thead>
        <tbody>
            @foreach($listData as $ld)
              <tr>
               <td>{{$loop->iteration}}</td>
               <td>{{$ld->nik}}</td>
               <td>{{$ld->name}}</td>
               <td>
                @if($ld->is_active == 0)
                  false
                 @else
                   true
                @endif
               </td>
               <td>{{$ld->gender}}</td>
               <td>{{$ld->usia}}</td>
               <td>{{$ld->school_name}}</td>
               <td>{{$ld->level}}</td>
               <td>1 istri & 2 anak</td>
              </tr>
            @endforeach
        </tbody>
    </table>
    </body>
</htmk>