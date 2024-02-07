{% macro margin(revenue, purchase_cost, precision=2) %}
  round(cast({{revenue}} as float64) - cast({{purchase_cost}} as float64), {{precision}})
{% endmacro %}