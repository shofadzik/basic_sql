select max(count)
from (
	select date_part('YEAR',shipping_limit_date::date), count(1)
	from public.olist_order_items_dataset_csv ooidc
	where 1=1
	group by 1
) a

select max(count)
from (
	select date_part('MONTH',shipping_limit_date::date), count(1)
	from public.olist_order_items_dataset_csv ooidc
	where 1=1
	group by 1
) a

select min(count)
from (
	select date_part('MONTH',shipping_limit_date::date), count(1)
	from public.olist_order_items_dataset_csv ooidc
	where 1=1
	group by 1
	order by 1
	offset 8
) a

select min(count)
from (
	select date_part('MONTH',shipping_limit_date::date), count(1)
	from public.olist_order_items_dataset_csv ooidc
	where 1=1
	group by 1
	order by 1
	limit 5
) a

select min(sum)
from (
	select payment_type, sum(payment_value)
	from (select *
	from (
		select order_id, payment_type, payment_value
		from public.olist_order_payments_dataset_csv oopdc
		group by 1,2,3
		order by 3 desc 
		offset 2
		limit 10
	) a
	where payment_value >= 50
) b
group by 1
) c 

select min(sum) --coba lagi
from (
	select payment_type, sum(payment_value)
	from (select *
		from (
			select order_id, payment_type, payment_value
			from public.olist_order_payments_dataset_csv oopdc
			group by 1,2,3
			order by 3 desc 
			offset 2
			limit 10
			) a
		where payment_type = 'credit_card' and payment_value > 6000
		) b
	group by 1
	) c 

select max(sum)
from (
	select payment_type, sum(payment_value)
	from (select *
		from (
			select order_id, payment_type, payment_value
			from public.olist_order_payments_dataset_csv oopdc
			group by 1,2,3
			order by 3 desc 
			offset 2
			limit 10
			) a
		where payment_value >= 50
		) b
	group by 1
	) c 

select payment_type, sum(payment_value)
from (
	select oopdc.order_id, payment_type, payment_value, order_purchase_timestamp
	from public.olist_order_payments_dataset_csv oopdc
	left join (
		select order_id, order_purchase_timestamp
		from public.olist_orders_dataset_csv oodc
		where order_status = 'delivered'
	)a
	on oopdc.order_id = a.order_id
	where 1=1 and date_part('YEAR',order_purchase_timestamp::date) >= 2017
)a
group by 1
offset 3

select payment_type, sum(payment_value)
from (
	select oopdc.order_id, payment_type, payment_value, order_purchase_timestamp
	from public.olist_order_payments_dataset_csv oopdc
	left join (
		select order_id, order_purchase_timestamp
		from public.olist_orders_dataset_csv oodc
		where order_status = 'delivered'
	)a
	on oopdc.order_id = a.order_id
	where 1=1 and date_part('MONTH',order_purchase_timestamp::date) = 12
)a
group by 1
offset 3

select payment_type, avg(payment_value)
from (
	select oopdc.order_id, payment_type, payment_value, order_purchase_timestamp
	from public.olist_order_payments_dataset_csv oopdc
	left join (
		select order_id, order_purchase_timestamp
		from public.olist_orders_dataset_csv oodc
		where order_status = 'delivered'
	)a
	on oopdc.order_id = a.order_id
	where 1=1 and date_part('YEAR',order_purchase_timestamp::date) >= 2017
)a
group by 1
offset 3