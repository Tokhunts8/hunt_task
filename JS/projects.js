function pagination(pages, current = 1, show = 2) {
    let start      = (current - show < 1) ? 1 : current - show;
    let end        = (current + show >= pages) ? pages : current + show;
    let pagination = $(`<nav aria-label='...'></nav>`);

    pagination.append($(`<ul class='pagination'></ul>`));
    for (var i = start; i <= end; i++) {
        let span = $(`<li class="page-item">
	  						<a class="page-link" href="/hunt_task/?offset=${i - 1}">${i}</a>
							</li>`);
        if (i == current) {
            span.addClass('active');
            span.find('span').append($(`<span class="sr-only">(current)</span>`));
        }
        pagination.find('ul').append(span);
    }
    if (start > 2) {
        let el = $(`<li class="page-item">
	  						<a class="page-link" href="/hunt_task/?offset=0">1</a>
							</li>`);

        let el1 = $(`<li class="page-item disabled">
	  						<span class="page-link">...</span>
							</li>`);
        pagination.find('ul').prepend(el);
        pagination.find('ul').prepend(el1);
    }
    if (end < pages - show) {
        let el = $(`<li class="page-item">
	  						<a class="page-link" href="/hunt_task/?offset=${pages - 1}">${pages}</a>
							</li>`);

        let el1 = $(`<li class="page-item disabled">
	  						<span class="page-link">...</span>
							</li>`);
        pagination.find('ul').append(el1);
        pagination.find('ul').append(el);
    }
    $('body').append(pagination);

}
