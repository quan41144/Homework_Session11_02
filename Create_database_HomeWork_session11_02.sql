create database Homework_session11_02;
-- create table
create table accounts(
	account_id serial primary key,
	owner_name varchar(100),
	balance numeric(10,2)
);
insert into accounts(owner_name, balance) values
('A', 500.00),
('B', 300.00);
-- Thực hiện giao dịch chuyển tiền hợp lệ
-- Dùng BEGIN; để bắt đầu transaction
begin;
-- Cập nhật giảm số dư của A, tăng số dư của B
update accounts set balance = balance - 100 where account_id = 1;
update accounts set balance = balance + 100 where account_id = 2;
-- Dùng COMMIT; để hoàn tất
commit;
-- Kiểm tra số dư mới của cả hai tài khoản
select * from accounts;
-- Thử mô phỏng lỗi và Rollback
-- Lặp lại quy trình trên, nhưng cố ý nhập sai account_id của người nhận
begin;
-- Cập nhật giảm số dư của A, tăng số dư của B
update accounts set balance = balance - 100 where account_id = 1;
update accounts set balance = balance + 100 where account_id = 2;
-- Gọi ROLLBACK; khi xảy ra lỗi
rollback;
-- Kiểm tra lại số dư, đảm bảo không có thay đổi
select * from accounts;