# KhoaBạc — web ghi chép tài chính cá nhân

Web tĩnh (HTML + JS) dùng **Supabase** để đăng nhập và lưu dữ liệu, chạy trên **GitHub Pages**. Mỗi người tự đăng ký và chỉ xem được sổ của mình (khoá bằng Row Level Security).

## Các file
| File | Dùng để |
|---|---|
| `index.html` | Toàn bộ app |
| `config.js` | Điền Supabase URL + anon key |
| `supabase.sql` | Tạo bảng `docs` và quyền truy cập, chạy 1 lần |
| `manifest.webmanifest`, `icon*` | Cho phép "Thêm vào màn hình chính" trên điện thoại |

## Cài đặt (1 lần)
1. **Supabase**: tạo project (vùng Singapore) → *SQL Editor* → dán nội dung `supabase.sql` → *Run*.
2. **Supabase > Authentication > URL Configuration**: *Site URL* = link GitHub Pages (vd `https://tenban.github.io/so-tien/`), thêm link này vào *Redirect URLs*. Để mail xác nhận và quên mật khẩu mở đúng trang.
3. **config.js**: điền `supabaseUrl` và `supabaseAnonKey` (Project Settings > API). Không dùng `service_role`.
4. **GitHub**: đưa các file lên repo → *Settings > Pages* → Source: *Deploy from a branch*, branch `main`, thư mục `/ (root)` → Save. Vài phút sau có link.

## Tuỳ chọn
- Muốn đăng ký xong dùng ngay, không cần bấm mail xác nhận: Supabase > Authentication > Providers > Email → tắt *Confirm email*.
- Ảnh linh vật riêng: bỏ ảnh vào thư mục `mascot/` và điền đường dẫn trong `config.js`. Chỉ dùng ảnh có quyền sử dụng.
- Gói miễn phí của Supabase giới hạn số email gửi mỗi giờ. Đông người đăng ký cùng lúc thì nên tắt *Confirm email* hoặc gắn SMTP riêng.

## Trên điện thoại
Mở link → Safari: nút Chia sẻ → *Thêm vào MH chính*. Chrome: menu ⋮ → *Thêm vào màn hình chính*. App mở toàn màn hình như app thật.
