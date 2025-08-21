******```StoreX Management System - Hệ thống Quản lý Cửa hàng```******

Đây là một ứng dụng desktop được xây dựng bằng C# WinForms và SQL Server để quản lý các hoạt động của một cửa hàng bán lẻ. Dự án bao gồm các chức năng quản lý sản phẩm, khách hàng, nhân viên, đơn hàng và hỗ trợ phân quyền người dùng theo vai trò.
(WinForms inspired by my friend VVA)
<img width="798" height="475" alt="image" src="https://github.com/user-attachments/assets/8cd2dc0b-4bd1-4367-8598-61c8245882c4" />

✨ Tính năng chính
- Quản lý Nhân viên: Thêm, sửa, xóa, tìm kiếm thông tin nhân viên.
- Quản lý Khách hàng: Quản lý thông tin và lịch sử mua hàng của khách hàng.
- Quản lý Sản phẩm: Theo dõi danh sách sản phẩm, số lượng tồn kho.
- Quản lý Đơn hàng: Tạo, cập nhật, xóa và tìm kiếm đơn hàng chi tiết.

Phân quyền Người dùng: Hệ thống có 3 vai trò chính:
+ Admin: Toàn quyền quản lý hệ thống.
+ Sales (Bán hàng): Quản lý khách hàng và tạo đơn hàng.
+ Warehouse (Kho): Chỉ quản lý thông tin sản phẩm.

💻 Công nghệ sử dụng
Ngôn ngữ: C#
Nền tảng: .NET Framework (Windows Forms)
Cơ sở dữ liệu: Microsoft SQL Server
IDE: Visual Studio

🚀 Hướng dẫn cài đặt
Để chạy dự án trên máy của bạn, hãy làm theo các bước sau:
- Yêu cầu:
Visual Studio 2019 (hoặc mới hơn) với workload ".NET desktop development".
Microsoft SQL Server 2019 (hoặc mới hơn) và SQL Server Management Studio (SSMS).
- Các bước cài đặt:
Clone repository:
git clone https://github.com/DucAnk113/StoreX-Management.git
- Thiết lập Cơ sở dữ liệu:
+ Mở SQL Server Management Studio (SSMS).
+ Tạo một database mới (ví dụ: StoreX).
+ Chạy file script SQL bạn đã tạo (.sql) để tạo các bảng và chèn dữ liệu mẫu.
- Cấu hình Connection String:
+ Mở file solution (.sln) trong Visual Studio.
+ Tìm đến file chứa chuỗi kết nối (thường là App.config hoặc trong một lớp riêng).
+ Cập nhật lại connection string để trỏ đến database StoreX bạn vừa tạo.
- Chạy ứng dụng:
+ Build project (Build -> Build Solution).
+ Nhấn F5 để bắt đầu debug và chạy ứng dụng.
