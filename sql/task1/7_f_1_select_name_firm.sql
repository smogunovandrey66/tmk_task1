select 
    f.name as NameFirm,
    cj.name as JurCity,
    cp.name as PostCity
from firm f
inner join city cj on f.jur_city_id = cj.city_id
left join city cp on f.post_city_id = cp.city_id
where upper(f.name) like upper('%газ%') --без учёта регистра 
--where f.name like '%Газ%' --с учётом регистра 
order by f.firm_id;