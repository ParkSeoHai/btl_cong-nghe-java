
// Set tab active by default to login
let tabActive = 'login';

// Set tab active
const setTabActive = () => {
	// Set tab active header
	const tabsHeader = document.querySelectorAll('.tab-item');
	tabsHeader.forEach(tab => {
		if (tab.getAttribute('tab') === tabActive) {
			tab.classList.add('active');
		} else {
			tab.classList.remove('active');
		}
	})
	// Set tab active content
	const tabsContent = document.querySelectorAll('.tab-content');
	tabsContent.forEach(tab => {
		if (tab.getAttribute('tab-content') === tabActive) {
			tab.classList.remove('d-none');
		} else {
			tab.classList.add('d-none');
		}
	})
}

// Change tab when click tab item
const changeTab = (tab) => {
	tabActive = tab;
	setTabActive();
}

// Handle show password login  
const showPasswordLogin = () => {
	const password = document.getElementById('password_login');
	const iconHide = document.querySelector('.hide-password__icon--login');
	const iconShow = document.querySelector('.show-password__icon--login');
	if (password.type === 'password') {
		password.type = 'text';
		iconHide.classList.add('d-none');
		iconShow.classList.remove('d-none');
	} else {
		password.type = 'password';
		iconHide.classList.remove('d-none');
		iconShow.classList.add('d-none');
	}
}

// Handle show password register
const showPasswordRegister = () => {
	const password = document.getElementById('password_register');
	const iconHide = document.querySelector('.hide-password__icon--register');
	const iconShow = document.querySelector('.show-password__icon--register');
	if (password.type === 'password') {
		password.type = 'text';
		iconHide.classList.add('d-none');
		iconShow.classList.remove('d-none');
	} else {
		password.type = 'password';
		iconHide.classList.remove('d-none');
		iconShow.classList.add('d-none');
	}
}

// Handle submit form login
const submitFormLogin = (e) => {
	e.preventDefault();
	const form = document.getElementById('form_login');
	const email = form.querySelector('#email').value;
	const password = form.querySelector('#password_login').value;
	const errorEmail = form.querySelector('.mess-error__email');
	const errorPassword = form.querySelector('.mess-error__password');

	let validEmail = true;
	let validPassword = true;

	// Check email format
	const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
	if (email.trim() === '') {
		errorEmail.textContent = 'Nhập email';
		validEmail = false;
	} else if (!emailRegex.test(email.trim())) {
		// Show error message
		errorEmail.textContent = 'Email không hợp lệ';
		validEmail = false;
	} else {
		errorEmail.textContent = '';
		validEmail = true;
	}
	
	// Check password length >= 6
	if (password.trim() === '') {
		errorPassword.textContent = 'Nhập mật khẩu';
		validPassword = false;
	} else if (password.trim().length < 6) {
		errorPassword.textContent = 'Mật khẩu phải có ít nhất 6 ký tự';
		validPassword = false;
	} else {
		errorPassword.textContent = '';
		validPassword = true;
	}
	// Submit form
	if (validEmail && validPassword) {
		form.submit();
	}
}

// Handle submit form register
const submitFormRegister = (e) => {
	e.preventDefault();
	const form = document.getElementById('form_register');
	const email = form.querySelector('#email_register').value;
	const password = form.querySelector('#password_register').value;
	const errorEmail = form.querySelector('.mess-error__email');
	const errorPassword = form.querySelector('.mess-error__password');
	const errorConfirmPassword = form.querySelector('.mess-error__confirm-password');
	
	let validEmail = true;
	let validPassword = true;
	let validConfirmPassword = true;
	
	// Check email format
	const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
	if (email.trim() === '') {
		errorEmail.textContent = 'Nhập email';
		validEmail = false;
	} else if (!emailRegex.test(email.trim())) {
		// Show error message
		errorEmail.textContent = 'Email không hợp lệ';
		validEmail = false;
	} else {
		errorEmail.textContent = '';
		validEmail = true;
	}
	
	// Check password length >= 6
	if (password.trim() === '') {
		errorPassword.textContent = 'Nhập mật khẩu';
		validPassword = false;
	} else if (password.trim().length < 6) {
		errorPassword.textContent = 'Mật khẩu phải có ít nhất 6 ký tự';
		validPassword = false;
	} else {
		errorPassword.textContent = '';
		validPassword = true;
	}
	
	// Check confirm password
	const confirmPassword = form.querySelector('#confirm_password').value;
	if (confirmPassword.trim() === '') {
		errorConfirmPassword.textContent = 'Nhập lại mật khẩu';
		validConfirmPassword = false;
	} else if (confirmPassword.trim() !== password.trim()) {
		errorConfirmPassword.textContent = 'Mật khẩu không khớp';
		validConfirmPassword = false;
	} else {
		errorConfirmPassword.textContent = '';
		validConfirmPassword = true;
	}
	
	// Submit form
	if (validEmail && validPassword && validConfirmPassword) {
		form.submit();
	}
}

setTabActive()

