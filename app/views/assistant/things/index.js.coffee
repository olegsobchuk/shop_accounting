$block = $('table#things tbody')
$block.empty()
$block.html("<%= j render partial: 'thing', collection: @things %>")