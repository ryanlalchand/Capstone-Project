select count(*) from lineitemAQP, ordersAQP where l_orderkey = o_orderkey and l_quantity < 20;
