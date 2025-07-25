create or replace function sales.recalculate_order_line_total () returns trigger as $$
BEGIN
  NEW.price_subtotal := COALESCE(NEW.quantity, 0) * COALESCE(NEW.unit_price, 0);
  NEW.price_total := NEW.price_subtotal + COALESCE(NEW.price_tax, 0);

  RETURN NEW;
END;
$$ language plpgsql;

drop trigger if exists recalculate_order_line_total_trigger on sales.order_line;

create trigger recalculate_order_line_total_trigger before insert
or
update on sales.order_line for each row
execute function sales.recalculate_order_line_total ();
