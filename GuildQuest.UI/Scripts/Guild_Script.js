var Guild = {};
var renderControls = function (container, currentPage, numPages) {
    var pagingControls = 'Page: <ul class="pagination pagination-lg pagination-circle bg-light-teal  d-inline-flex">';
    for (var i = 1; i <= numPages; i++) {
        if (i !== currentPage) {
            pagingControls +=
                '<li class="page-item"><a class="page-link" href="#" onclick="Pager.showPage(' +
                i +
                '); return false;">' +
                i +
                '</a></li>';
        } else {
            pagingControls +=
                '<li class="page-item active"><a class="page-link" href="#" disabled>' +
                i +
                '</a></li>';
        }
    }
    pagingControls += '</ul>';
    $(container).html(pagingControls);
};
Guild.Pager = function() {
    this.paragraphsPerPage = 3;
    this.currentPage = 1;
    this.pagingControlsContainer = '.pagingControls';
    this.pagingContainerPath = '#inventoryList';
    this.numPages = function() {
        var numPages = 0;
        if (this.paragraphs !== null && this.paragraphsPerPage !== null) {
            numPages = Math.ceil(this.paragraphs.length / this.paragraphsPerPage);
        }
        return numPages;
    };
    this.showPage = function(page) {
        this.currentPage = page;
        var html = '';
        this.paragraphs.slice((page - 1) * this.paragraphsPerPage,
             (page - 1) * this.paragraphsPerPage + this.paragraphsPerPage).each(function() {
            html += '<div class="card z-depth-5 hoverable">' + $(this).html() + '</div>';
        });
        $(this.pagingContainerPath).html(html);
        renderControls(this.pagingControlsContainer, this.currentPage, this.numPages());
    };
   
};

Guild.RePager =function () {
    var pager = new Guild.Pager();

    pager.paragraphsPerPage = 5; // set amount elements per page
    pager.pagingContainer = $('#inventoryList'); // set of main container
    pager.paragraphs = $('.card', pager.pagingContainer); // set of required containers
    pager.showPage(1);

}




