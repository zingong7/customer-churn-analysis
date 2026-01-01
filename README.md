# Customer Churn Analysis & Prediction

## 📊 Project Overview

This project presents a comprehensive analysis of customer churn patterns using SQL, Power BI, and machine learning techniques. The analysis identifies key factors contributing to customer attrition and predicts future churners using a Random Forest classification model.

## 🎯 Key Findings

- **Overall Churn Rate**: 27% (1,732 out of 6,418 customers)
- **New Joiners**: 411 customers
- **High-Risk Segments**: Month-to-month contracts (47% churn rate), customers with mailed check payments (38% churn rate)
- **Predicted Future Churners**: 381 customers identified as at-risk

## 🛠️ Technologies Used

- **Database**: SQL Server
- **Visualization**: Power BI
- **Machine Learning**: Python (Jupyter Notebook)
  - Random Forest Classifier
  - Scikit-learn
  - Pandas, NumPy
- **Version Control**: Git/GitHub

## 📁 Project Structure

```
churn-analysis/
│
├── sql/
│   └── churn_analysis_queries.sql    # SQL queries for data analysis
│
├── power-bi/
│   └── churn_dashboard.pbix          # Power BI report file
│
├── notebooks/
│   └── random_forest_model.ipynb     # Jupyter notebook for ML model
│
├── data/
│   ├── stg_churn.csv                 # Staging data
│   └── prod_churn.csv                # Production data
│
└── README.md
```

## 📈 Analysis Components

### 1. SQL Analysis

The SQL queries perform comprehensive data exploration and transformation:

- **Data Quality Checks**: Null value detection and handling
- **Churn Metrics**: Overall and segmented churn rates
- **Customer Segmentation**: By gender, contract type, tenure, state, and services
- **Revenue Analysis**: Revenue loss calculation by customer status
- **Data Preparation**: Creating production tables and views

### 2. Power BI Dashboard

#### Summary Dashboard
- Total customer metrics and KPIs
- Churn rate by demographics (gender, age group)
- Geographic analysis (top 5 states by churn rate)
- Contract and payment method analysis
- Service usage patterns
- Churn distribution by category

#### Prediction Dashboard
- Predicted churners breakdown (248 female, 133 male)
- At-risk customer segmentation by:
  - Age group
  - Marital status
  - Tenure
  - State
  - Payment method
  - Contract type
- Detailed customer list with risk indicators

### 3. Machine Learning Model

**Random Forest Classifier** used to predict future churners based on:
- Customer demographics (age, gender, marital status)
- Service usage patterns
- Contract details
- Payment behavior
- Tenure and engagement metrics

## 🔍 Key Insights

### High Churn Risk Factors:
1. **Contract Type**: Month-to-month contracts show 47% churn rate
2. **Payment Method**: Mailed check users have 38% churn rate
3. **Tenure**: Customers with <6 months tenure are most vulnerable
4. **Geographic**: Jammu shows highest churn rate at 57%
5. **Services**: Lower adoption of premium services correlates with higher churn

### Revenue Impact:
- **Competitor-related churn**: 761 customers lost (highest category)
- **Attitude-related churn**: 301 customers
- **Dissatisfaction**: 300 customers
- **Price sensitivity**: 196 customers

## 📊 Database Schema

**Main Table: `prod_churn`**
- Customer demographics (customer_id, gender, age, married, state)
- Service details (phone_service, internet_type, streaming services)
- Contract information (contract, tenure_in_months, payment_method)
- Financial metrics (monthly_charge, total_revenue, total_refunds)
- Churn indicators (customer_status, churn_category, churn_reason)

## 🎯 Business Recommendations

1. **Focus on Early Engagement**: Target customers in their first 6 months
2. **Contract Incentives**: Encourage long-term contracts with benefits
3. **Payment Modernization**: Promote digital payment methods
4. **Geographic Strategy**: Address high-churn regions (Jammu, Assam, Jharkhand)
5. **Service Bundling**: Increase adoption of premium services
6. **Proactive Retention**: Reach out to 381 predicted churners immediately

## 📝 Future Enhancements

- [ ] Real-time churn prediction API
- [ ] A/B testing framework for retention strategies
- [ ] Customer lifetime value (CLV) modeling
- [ ] Automated alerting system for high-risk customers
- [ ] Integration with CRM systems
