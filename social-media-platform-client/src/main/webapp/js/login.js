function validateForm()
{
    // Bước 1: Lấy giá trị của email và password
    var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;
 
    // Bước 2: Kiểm tra dữ liệu hợp lệ hay không
    if (username == ''){
        alert('You have not entered your username');
    }
    else if (password == '')
    {
        alert('You have not entered your password');
    }
    else{
        alert('Because of valid data, submit form is accepted');
        return true;
    }
 
    return false;
}