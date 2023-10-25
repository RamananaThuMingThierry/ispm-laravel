<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Models\preSelections;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class PreSelectionsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $preSelections = preSelections::all();
        return response()->json([
            'status' => 200,
            'preSelections' => $preSelections
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nom' => 'required',
            'contact' => 'required|date',
            'documents' => 'required|date'
        ]);

        if($validator->fails()){
            return response()->json([
                'status' => 422,
                'errors' => $validator->messages(), 
            ]);

        }else{
             
            $preSelections = new preSelections();

            $preSelections->nom = $request->nom;
            $preSelections->contact = $request->contact;
            $preSelections->documents = $request->documents;
            $preSelections->save();

            return response()->json([
                'status' => 200,
                'message' => 'Enregistrement effectuée!',
            ]);
        }

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'nom' => 'required',
            'contact' => 'required',
            'documents' => 'required'
        ]);

        if($validator->fails()){    
            return response()->json([
                'status' => 422,
                'errors' => $validator->messages(), 
            ]);

        }else{
            $preSelections = preSelections::find($id);

            if($preSelections){
                
                $preSelections-> save();

                return response()->json([
                    'status' => 200,
                    'message' => 'Modification effectuée!',
                ]);
            }else{
                return response()->json([
                    'status' => 404,
                    'message' => 'Product Not Found'
                ]);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $preSelections =  preSelections::find($id);

        if($preSelections){
            $preSelections->delete();
            return response()->json([
                'status' => 200,
                'message' => 'Suppression a été bien effectuée!',
            ]);

        }else{
            return response()->json([
                'status' => 404,
                'message' => 'Aucun donnée trouvé!'
            ]);
        }
    }
}
