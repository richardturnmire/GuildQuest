var Guild = {};

Guild.Pager = function() {
    this.paragraphsPerPage = 5;
    this.currentPage = 1;
    this.pagingControlsContainer = '.pagingControls';
    this.pagingContainerPath = '#inventoryList'; // set of main container
    this.paragraphs = $('.card', $(this.pagingContainerPath)); // set of required containers
    // this.pagingContainerPath = '#inventoryList';
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

    var renderControls = function (container, currentPage, numPages) {
        var pagingControls = 'Page: <ul class="pagination pagination-lg pagination-circle pager bg-light-teal  d-inline-flex">';
        for (var i = 1; i <= numPages; i++) {
            if (i !== currentPage) {
                pagingControls +=
                    '<li class="page-item"><a class="page-link" href="#" onclick="pager.showPage(' +
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
   
};

