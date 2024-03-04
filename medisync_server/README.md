-   Bikin database migrations
-   bua API-nya di Laravel
-   Buat dokumentasi nya di Postman

/api/doctors
/api/doctor_schedules
/api/specializations
/api/orders

1. Buat project laravel
2. Migasikan Database yang diperlukan

Buatlah migrasi untuk tabel

## users

name
photo
email
address
phone_number
whatsapp_number

## doctors

doctor_name
photo
specialization_id
hospital_id

## hospitals

photo
hospital_name
hospital_address
hospital_location_latitude
hospital_location_longitude

## doctor_schedules

hospital_id
doctor_id
schedule_date
schedule_time (string)
patient_limit

## specializations

specializations_name

## orders

doctor_id
user_id
schedule_id
patient_name
patient_dob
patient_gender
patient_id_card
patient_address
patient_phone_number
patient_whatsapp_number
payment_type (string)
payment_transaction_id (string)
payment_order_id (string)
payment_transaction_status (string)
payment_callback_detail (string)

## tahapan

1. Migration
2. Buat Model dari semua Tabel
3. Buat Seeder -> Data Dummy
4. Controller
5. Daftarkan di route/api.php
6. Buat dokumentasinya di Postman dll
