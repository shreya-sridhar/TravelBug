x = "<HTML><HEAD><meta http-equiv=\"content-type\" content=\"text/html;charset=utf-8\">\n<TITLE>302 Moved</TITLE></HEAD><BODY>\n<H1>302 Moved</H1>\nThe document has moved\n<A HREF=\"https://lh3.googleusercontent.com/p/AF1QipP8NB167cxywHBCsv70vmaWqUVMWXOrPOfSjeA2=s1600-w400-h400\">here</A>.\r\n</BODY></HTML>\r\n"


y = x.split('<HTML><HEAD><meta http-equiv=\"content-type\" content=\"text/html;charset=utf-8\">\n<TITLE>302 Moved</TITLE></HEAD><BODY>\n<H1>302 Moved</H1>\nThe document has moved\n<A HREF=\')

z = y.split("">here</A>.\r\n</BODY></HTML>\r\n")[0]

