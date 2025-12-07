SELECT author_name, other_details FROM Authors WHERE author_name = (SELECT author_name FROM Documents WHERE document_name = 'Travel to China');
