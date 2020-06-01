function validateForm()
{
    // Bước 1: Lấy giá trị của email và password
    var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;
 
    // Bước 2: Kiểm tra dữ liệu hợp lệ hay không
    if (email == ''){
        alert('You have not entered your email');
    }
    else if(firstname==''){
        alert('You have not entered your first name')
    }
    else if(lastname==''){
        alert('You have not entered your lastname')
    }
    else if (password == '')
    {
        alert('You have not entered your password');
    }
    else if(confirmpassword==''){
        alert('You have not entered your confirmed password')
    }
    else if(username==''){
        alert('You have not entered your username')
    }
    else{
        alert('Because of valid data, submit form is accepted');
        return true;
    }
 
    return false;
}