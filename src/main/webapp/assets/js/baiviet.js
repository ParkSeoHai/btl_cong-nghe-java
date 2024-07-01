
// dv_1 dv_3(test) di chuyển theo trang
/*window.onscroll = function() {
	// Lấy giá trị cuộn hiện tại
	var scrollTop = window.pageYOffset || document.documentElement.scrollTop;

	// Thay đổi vị trí của phần tử với class "dv_1"
	var dv1 = document.querySelector('.dv_1');
	if (dv1) {
		dv1.style.top = scrollTop + 'px'; // Di chuyển từ top: 0
	}

	// Thay đổi vị trí của phần tử với class "test"
	var test = document.querySelector('.test');
	if (test) {
		test.style.position = 'absolute';
		test.style.top = (scrollTop + 70) + 'px'; // Điều chỉnh vị trí theo cuộn
	}

	// Kiểm tra vị trí của phần tử dv_2
	var dv2 = document.querySelector('.dv_2');
	if (dv2) {
		var dv2Rect = dv2.getBoundingClientRect();
		var dv2Top = dv2Rect.top + window.pageYOffset;
		var dv2Height = dv2Rect.height;
		var fadeStart = dv2Top + (0.8 * dv2Height);
		var fadeEnd = dv2Top + (0.85 * dv2Height); // Thay đổi phạm vi mờ dần để biến mất nhanh hơn

		// Nếu cuộn vượt qua 80% chiều cao của dv_2
		if (scrollTop >= fadeStart) {
			var opacity = 1 - Math.min(1, (scrollTop - fadeStart) / (fadeEnd - fadeStart));
			if (dv1) {
				dv1.style.opacity = opacity;
				dv1.style.pointerEvents = opacity === 0 ? 'none' : 'auto';
			}
			if (test) {
				test.style.opacity = opacity;
				test.style.pointerEvents = opacity === 0 ? 'none' : 'auto';
			}
		} else {
			if (dv1) {
				dv1.style.opacity = 1;
				dv1.style.pointerEvents = 'auto';
			}
			if (test) {
				test.style.opacity = 1;
				test.style.pointerEvents = 'auto';
			}
		}
	}
};*/


// Biểu cảm trong nhập bình luận
/*document.addEventListener('DOMContentLoaded', function() {
	const emojiIcon = document.querySelector('.icon_emoji');
	const emojiList = document.querySelector('.list_emoji');

	emojiIcon.addEventListener('click', function() {
		emojiList.classList.toggle('show');
	});
});


document.addEventListener('DOMContentLoaded', function() {
	const emojiIcon_reply = document.querySelector('.icon_emoji_reply');
	const emojiList_reply = document.querySelector('.list_emoji_reply');

	emojiIcon_reply.addEventListener('click', function() {
		emojiList_reply.classList.toggle('show');
	});
});*/

// Hien thi form reply comment
const linkReplies = document.querySelectorAll('.link_reply');
linkReplies.forEach((linkReply) => {
	linkReply.addEventListener('click', function(event) {
		event.preventDefault(); // Ngăn chặn hành động mặc định của thẻ <a>
		const replyInputComment = linkReply.closest('.nd_comment').querySelector('.reply_input_comment');
		if (replyInputComment) {
			replyInputComment.style.display = replyInputComment.style.display === 'none' ? 'block' : 'none';
		}
	});
});

function toggle_reply_input_comment(event) {
	event.preventDefault(); // Ngăn chặn hành động mặc định của thẻ <a>
	var reply_input_comment = document.querySelector(".reply_input_comment");
	if (reply_input_comment) {
		reply_input_comment.style.display = reply_input_comment.style.display === "none" ? "block" : "none";
	}
}

// hiển thị thêm rep comment

// Lấy phần tử có class "view_all_reply"
var viewAllReplyLinks = document.querySelectorAll('.count_reply');

// Thêm sự kiện click vào liên kết "Xem thêm"
viewAllReplyLinks.forEach((viewAllReplyLink) => {
	viewAllReplyLink.addEventListener('click', function(event) {
		event.preventDefault(); // Ngăn chặn hành động mặc định của thẻ <a>

		const parentNode = viewAllReplyLink.parentNode;
		// Lấy phần tử có class "muc_sub_comment"
		const mucSubComments = parentNode.querySelectorAll('.muc_sub_comment');
		
		// Kiểm tra và chuyển đổi trạng thái hiển thị của mucSubComment
		mucSubComments.forEach((mucSubComment) => {
			if (mucSubComment.style.display === 'block') {
				mucSubComment.style.display = 'none';
			} else {
				mucSubComment.style.display = 'block';
			}
		});
		
		viewAllReplyLink.classList.add('d-none');
	});
})

// Submit form binh luan bai viet
const binhluanBaiViet = (event, idBaiViet) => {
	event.preventDefault();
	
	const form = event.target;
	const id_user = document.querySelector('.user-id').value;
	const content = form.querySelector('.txt_comment').value;
    const dateTime = new Date();
	const time = dateTime.getDate() + '/' + (dateTime.getMonth() + 1) + '/' + dateTime.getFullYear() + ' ' + dateTime.getHours() + ':' + dateTime.getMinutes() + ':' + dateTime.getSeconds();
	const id_binhLuan = 0;
	
	if (id_user == '0') {
		alert('Vui lòng đăng nhập để bình luận');
		location.href = '/btl_docbao/views/login.jsp';
		return;
	}
	
	const data = {
		content: content,
		time: time,
		id_baiViet: idBaiViet,
		id_user: id_user,
		id_binhLuan: id_binhLuan,
	};
	
	// Gửi dữ liệu lên server
	const url = `${location.origin}/btl_docbao/addBinhLuanAction`
	fetch(url, {
		method: 'POST',
		headers: {
		   	'Content-Type': 'application/json'
		},
		body: JSON.stringify(data)
	})
		.then(response => response.text())
	   	.then(result => {
			if (result === 'true') {
				location.reload();
			} else {
				alert('Bình luận thất bại');
			}
		})
	  	.catch(error => console.error('Error:', error));
};


// Submit form reply binh luan
const replyBinhLuan = (event, idBinhLuan, idBaiViet) => {
	event.preventDefault();
	
	const form = event.target;
	const id_user = document.querySelector('.user-id').value;
	const content = form.querySelector('.txt_comment').value;
	const dateTime = new Date();
	const time = dateTime.getDate() + '/' + (dateTime.getMonth() + 1) + '/' + dateTime.getFullYear() + ' ' + dateTime.getHours() + ':' + dateTime.getMinutes() + ':' + dateTime.getSeconds();

	if (id_user == '0') {
		alert('Vui lòng đăng nhập để bình luận');
		location.href = '/btl_docbao/views/login.jsp';
		return;
	}
	
	const data = {
		content: content,
		time: time,
		id_baiViet: idBaiViet,
		id_user: id_user,
		id_binhLuan: idBinhLuan,
	};
	
	// Gửi dữ liệu lên server
	const url = `${location.origin}/btl_docbao/addBinhLuanAction`
	fetch(url, {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify(data)
	})
		.then(response => response.text())
		.then(result => {
			if (result === 'true') {
				location.reload();
			} else {
				alert('Bình luận thất bại');
			}
		})
		.catch(error => console.error('Error:', error));
};


// Bay to cam xuc
const emotionAction = (idBinhluan, idEmotion) => {
	const id_user = document.querySelector('.user-id').value;
	if (id_user == '0') {
		alert('Vui lòng đăng nhập để thực hiện');
		location.href = '/btl_docbao/views/login.jsp';
		return;
	}

	const data = {
		id_binhLuan: idBinhluan,
		id_emotion: idEmotion,
	};

	// Gửi dữ liệu lên server
	const url = `${location.origin}/btl_docbao/emotionAction`
	fetch(url, {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify(data)
	})
		.then(response => response.text())
		.then(result => {
			if (result === 'true') {
				location.reload();
			} else {
				alert('Thất bại');
			}
		})
		.catch(error => console.error('Error:', error));
};


// Lưu bài viết
const saveBaiViet = (idBaiViet, idUser) => {
	const id_user = document.querySelector('.user-id').value;
	if (id_user == '0') {
		alert('Vui lòng đăng nhập để thực hiện');
		location.href = '/btl_docbao/views/login.jsp';
		return;
	}
	
	const data = {
		id_baiViet: idBaiViet,
		id_user: idUser,
	};
	
	// Gửi dữ liệu lên server
	const url = `${location.origin}/btl_docbao/SaveBaiVietAction`
	fetch(url, {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify(data)
	})
		.then(response => response.text())
		.then(result => {
			if (result === 'true') {
				alert('Lưu bài viết thành công');
				location.reload();
			} else {
				alert('Thất bại');
			}
		})
		.catch(error => console.error('Error:', error));
};

// Hủy lưu bài viết
const removeSaveBaiViet = (idUser, idBaiviet) => {
	const data = {
		id_user: idUser,
		id_baiViet: idBaiviet,
	};

	// Gửi dữ liệu lên server
	const url = `${location.origin}/btl_docbao/RemoveSaveBaiVietAction`
	fetch(url, {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify(data)
	})
		.then(response => response.text())
		.then(result => {
			if (result === 'true') {
				alert('Hủy lưu bài viết thành công');
				location.reload();
			} else {
				alert('Thất bại');
			}
		})
		.catch(error => console.error('Error:', error));
};

const copyLinkBaiViet = (event) => {
	event.preventDefault();
	
	const link = location.href;
    const input = document.createElement('input');
	input.value = link;
	document.body.appendChild(input);
	input.select();
	document.execCommand('copy');
	document.body.removeChild(input);
	alert('Đã sao chép liên kết');
}



