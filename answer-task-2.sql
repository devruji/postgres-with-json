-- Operational Database: PostgreSQL

with c as(
	select
		salesOrderId,
		unnest(products) products_json
	from postgres.public.sales_order
)

select
	salesorderid,
	promotion_name,
	"sales_summarized (THB)",
	round("sales_summarized (THB)" / thb_to_usd::text::decimal, 3) as "sales_summarized (USD)"
from (
	select
		salesorderid,
		sum(grossamount::text::decimal) as "sales_summarized (THB)",
		(
			select
				rates::json -> 'THB' as thb_to_usd
			from postgres.public.daily_usd_exchange_rate duer
			order by date desc
			limit 1
		),
		(
			select
				promotionname as promotion_name
			from postgres.public.promotion
			limit 1
		)
	from (
		select
			salesorderid,
			products_json::json ->> 'grossAmount' as grossAmount
		from c
	) tbl1
	group by salesorderid
) tbl2