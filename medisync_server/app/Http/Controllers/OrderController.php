<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{
    public function index(Request $request)
    {
        $query = Order::query();

        // Handle query parameters
        if ($request->has('sort_by')) {
            $sortColumn = $request->get('sort_by');
            $sortType = $request->get('sort_type', 'asc');
            $query->orderBy($sortColumn, $sortType);
        }

        $limit = $request->get('limit', 10);
        $orders = $query->paginate($limit);

        return response()->json($orders);
    }

    public function show($id)
    {
        $order = Order::find($id);

        if (!$order) {
            return response()->json(['error' => 'Order not found'], 404);
        }

        return response()->json(['data' => $order]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'doctor_id' => 'required|exists:doctors,id',
            'user_id' => 'required|exists:users,id',
            'schedule_id' => 'required|exists:doctor_schedules,id',
            'patient_name' => 'required|string',
            'patient_dob' => 'required|date',
            'patient_gender' => 'required|in:male,female',
            'patient_id_card' => 'required|string',
            'patient_address' => 'required|string',
            'patient_phone_number' => 'required|string',
            'patient_whatsapp_number' => 'required|string',
            'payment_type' => 'required|string',
            'payment_transaction_id' => 'required|string',
            'payment_order_id' => 'required|string',
            'payment_transaction_status' => 'required|string',
            'payment_callback_detail' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        $order = Order::create($request->all());

        return response()->json(['data' => $order], 201);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'doctor_id' => 'exists:doctors,id',
            'user_id' => 'exists:users,id',
            'schedule_id' => 'exists:doctor_schedules,id',
            'patient_name' => 'string',
            'patient_dob' => 'date',
            'patient_gender' => 'in:male,female',
            'patient_id_card' => 'string',
            'patient_address' => 'string',
            'patient_phone_number' => 'string',
            'patient_whatsapp_number' => 'string',
            'payment_type' => 'string',
            'payment_transaction_id' => 'string',
            'payment_order_id' => 'string',
            'payment_transaction_status' => 'string',
            'payment_callback_detail' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        $order = Order::find($id);

        if (!$order) {
            return response()->json(['error' => 'Order not found'], 404);
        }

        $order->update($request->all());

        return response()->json(['data' => $order], 200);
    }

    public function destroy($id)
    {
        $order = Order::find($id);

        if (!$order) {
            return response()->json(['error' => 'Order not found'], 404);
        }

        $order->delete();

        return response()->json(['message' => 'Order deleted successfully'], 200);
    }
}
