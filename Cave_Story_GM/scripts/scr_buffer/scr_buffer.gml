/*
	2.3 multiple functions per script WOOO
*/

function BufferReadString(b)
{
	var text = "";
	repeat(buffer_read(b, buffer_u8))
	{
		text += chr(buffer_read(b, buffer_u8));
	}
	return text;
}

function BufferWriteString(b, text)
{
	var n = string_length(text);
	
	buffer_write(b, buffer_u8, n);
	for (var i = 1; i <= n; i++)
	{
		buffer_write(b, buffer_u8, string_ord_at(text, i));
	}
}

