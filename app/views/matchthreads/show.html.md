<h1><%= @matchthread.title %></h1>
<h2><%= link_to 'view comments', comment_path(@matchthread.thread_id) %></h2>
*<p><%= @matchthread.text %></p>*