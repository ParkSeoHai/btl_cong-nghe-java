
// Image upload to cloudinary
async function uploadImage(file, folderName) {
    const cloudName = 'dvtvl2un6';
    const unsignedUploadPreset = 'sqsfjomd';
    const url = `https://api.cloudinary.com/v1_1/${cloudName}/upload`;

    const fd = new FormData();
    fd.append('folder', folderName);
    fd.append('upload_preset', unsignedUploadPreset);
    fd.append('tags', 'browser_upload'); // Optional - add tags for image admin in Cloudinary
    fd.append('file', file);

    const response = await fetch(url, {
        method: 'POST',
        body: fd,
        headers: {
            'X-Requested-With': 'XMLHttpRequest',
        },
    });

    return response.json();
}

const submitAddBaiViet = async (e) => {
	e.preventDefault();
	
	const form = e.target;
	
	const title = form.querySelector('#title').value;
	const author = form.querySelector('#author').value;
	const category = form.querySelector('#category').value;
	const image = form.querySelector('#image');
	const content = descriptionEditor.getHTML();
	const description = form.querySelector('#description').value;
	const dateTime = new Date();
	const createDate = dateTime.getDate() + '/' + (dateTime.getMonth() + 1) + '/' + dateTime.getFullYear() + ' ' + dateTime.getHours() + ':' + dateTime.getMinutes() + ':' + dateTime.getSeconds();
	
	if (!title || !author || !category || !image.files[0] || !content || !description) {
		alert("Vui lòng điền đầy đủ thông tin bài viết!");
		return;
	}
	
	// Upload image to cloudinary
	const imageUpload = await uploadImage(image.files[0], `webtintuc/${title}`);
	// image.secure_url;
	
	const data = {
		title: title,
		description: description,
		author: author,
		category: category,
		image: imageUpload.secure_url,
		content: content,
		createDate: createDate
	};
	
	// Gửi dữ liệu lên server
	const url = `${location.origin}/btl_docbao/AddBaiVietAction`
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
				alert('Thêm bài viết thành công');
				window.location.href = '/btl_docbao/views/admin.jsp';
			} else {
				alert('Thêm bài viết thất bại');
			}
		})
		.catch(error => console.error('Error:', error));
		
	console.log(data);
}

const submitUpdateBaiViet = async (e) => {
	e.preventDefault();
		
	const form = e.target;
	
	const id = form.querySelector('#id').value;
	const title = form.querySelector('#title').value;
	const author = form.querySelector('#author').value;
	const category = form.querySelector('#category').value;
	const image = form.querySelector('#image');
	const content = descriptionEditor.getHTML();
	const description = form.querySelector('#description').value;
	let imageSrc = "";
		
	if (!title || !author || !category || !content || !description) {
		alert("Vui lòng điền đầy đủ thông tin bài viết!");
		return;
	}
	
	if (image.files[0]) {
		// Upload image to cloudinary
		const imageUpload = await uploadImage(image.files[0], `webtintuc/${title}`);
		imageSrc = imageUpload.secure_url;
	}
		
	const data = {
		id: id,
		title: title,
		description: description,
		author: author,
		category: category,
		image: imageSrc,
		content: content,
	};
		
	// Gửi dữ liệu lên server
	const url = `${location.origin}/btl_docbao/UpdateBaiVietAction`
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
				alert('Cập nhật bài viết thành công');
				window.location.href = '/btl_docbao/views/admin.jsp';
			} else {
				alert('Cập nhật bài viết thất bại');
			}
		})
		.catch(error => console.error('Error:', error));
			
	console.log(data);
}

const SearchBaiviet = () => {
	const searchString = document.querySelector('.search-input').value;
	if (searchString.trim() !== '') {
		window.location.href = `/btl_docbao/views/admin.jsp?search=${searchString}`;
	}
}

const deleteBaiViet = (id) => {
	if (id == '') {
		alert('Không tìm thấy bài viết');
		return;
	}
	
	const is_delete = confirm('Bạn có chắc muốn xóa bài viết này?');
	if (is_delete) {
		window.location.href = `/btl_docbao//BaiViet/Delete?id=${id}`;
	}
}











