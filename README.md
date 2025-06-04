# Laptronics Analysis 2019 - 2022


## Project Background
As part of Laptronics' data analytics team, I was tasked with conducting in-depth analysis on various aspects of the company's sales performance, product-level metrics, and the impact of the newly launched loyalty program. The goal was to derive actionable insights that could guide strategic decisions, improve sales performance, and assess the success of recent marketing initiatives.

**Sales Trends Analysis**
- Evaluate historical sales patterns at a global and regional level.
- Visualize on revenue, order volume, and order value to identify key drivers of performance.

**Product Level Performance Analysis**
- Perform detailed analysis on Laptronics’ product lines to understand their impact on sales.
- Evaluate the performance of products in terms of both sales and returns to determine profitability.

**Loyalty Program Marketing Assessment**
- Assess the effectiveness of Laptronics’ recently launched loyalty program.
- Measure its impact on sales and customer retention, identifying patterns and recommendations for improving customer engagement.

## Data Structure, Cleanup, and EDA
![Database Diagram](https://github.com/johnathonpak/Laptronics-Analysis/blob/main/data/Laptronics%20Database%20Diagram.png)

You can access the database used in this project via [this BigQuery Dataset](https://console.cloud.google.com/bigquery?ws=!1m4!1m3!3m2!1sdata-analysis-projects-456521!2slaptronics_data) to explore the data and replicate the analysis.


SQL Queries performed to clean `geo_location` table can be [found here](code/geo_location_cleanup.sql)

SQL Queries performed to clean and analyze `orders_raw` can be [found here](code/orders_cleanup.sql)

## Executive Summary
<div class='tableauPlaceholder' id='viz1749070446198' style='position: relative'><noscript><a href='#'><img alt='Summary ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;La&#47;LaptronicsAnalysis&#47;Dashboard1&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='LaptronicsAnalysis&#47;Dashboard1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;La&#47;LaptronicsAnalysis&#47;Dashboard1&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='language' value='en-US' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1749070446198');                    var vizElement = divElement.getElementsByTagName('object')[0];                    if ( divElement.offsetWidth > 800 ) { vizElement.style.width='1500px';vizElement.style.height='1177px';} else if ( divElement.offsetWidth > 500 ) { vizElement.style.width='1500px';vizElement.style.height='1177px';} else { vizElement.style.width='100%';vizElement.style.height='3077px';}                     var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>

Interactive Tableau Dashboard can be [found here](https://public.tableau.com/views/LaptronicsAnalysis/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link).
### Overview of Findings

