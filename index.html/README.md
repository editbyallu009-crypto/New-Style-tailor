rements.txt# Tailor Shop App (Flask + MySQL)

Customer QR scan karta hai, apni detail, naap aur design bhejta hai. Silai ka price apne aap
aata hai. Owner dashboard mein customer details, design, status aur payment sab dikhta hai.

## Setup (sirf ek baar)

1. **Python** (3.9+) aur **MySQL Server** install karein. MySQL ka root password yaad rakhein.
2. Is folder mein terminal/command prompt kholein:
   ```
   pip install -r requirements.txt
   ```
3. `.env.example` ko copy karke `.env` naam dein, aur andar apna MySQL password,
   ADMIN_PASSWORD (owner login) aur SECRET_KEY bharein.
4. App chalayein:
   ```
   python app.py
   ```
   Database aur tables apne aap ban jayenge.
5. Browser mein kholein:
   - Customer form: `http://localhost:5000/order`
   - Owner login:   `http://localhost:5000/admin`
6. Login karke **Silai Price** page par apne rates bharein (shuru mein sab 0 hain).
7. **QR** page se QR print karke counter par lagayein.

## Customer ke phone se kaise chalega?

Laptop aur customer ka phone **ek hi Wi-Fi** par hone chahiye.
- Windows: command prompt mein `ipconfig` chalayein, "IPv4 Address" dekhein (jaise 192.168.1.5).
- QR page par link `http://192.168.1.5:5000/order` karke QR banayein.
- Computer chalu aur `python app.py` running rakhein.

Agar customer dukaan ke bahar se bhi order dena chahe, to app ko online hosting par
chadhana padega (jaise PythonAnywhere ya VPS). Tab MySQL bhi wahin chahiye.

## Zaroori suraksha

- ADMIN_PASSWORD lamba rakhein aur kisi ko na batayein.
- `.env` file kisi ko share na karein.
- Backup lete rahein: `mysqldump -u root -p tailor_shop > backup.sql`
- `uploads` folder mein design photos hain, use bhi backup karein.

## Folder
- `app.py` - poora app code
- `templates/` - pages, `static/style.css` - design
- `schema.sql` - tables ka structure (sirf samajhne ke liye)
