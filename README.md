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
│   ├── stg_churn.csv                 # Staging data (all customers)
│   ├── churned_stayed.csv            # Training data (Churned + Stayed)
│   ├── joined.csv                    # New customers for prediction
│
└── README.md
```

## 📈 Analysis Components

### 1. Data Preparation

The dataset contains three customer statuses:
- **Churned**: Customers who left the service (used for training)
- **Stayed**: Customers who remained with the service (used for training)
- **Joined**: New customers without churn history (used for prediction)

**Data Splitting Strategy**:
- Created separate datasets for model training (Churned + Stayed) and prediction (Joined)
- SQL views created: `vw_churndata` (Churned + Stayed) and `vw_joined` (Joined customers)

### 2. SQL Analysis

The SQL queries perform comprehensive data exploration and transformation:

- **Data Quality Checks**: Null value detection and handling
- **Churn Metrics**: Overall and segmented churn rates (based on Churned vs Stayed)
- **Customer Segmentation**: By gender, contract type, tenure, state, and services
- **Revenue Analysis**: Revenue loss calculation by customer status
- **Data Preparation**: Creating production tables and views
  - `vw_churndata`: View for Churned and Stayed customers (training data)
  - `vw_joined`: View for Joined customers (prediction data)

### 3. Power BI Dashboard

#### Summary Dashboard
- Total customer metrics and KPIs
- Churn rate by demographics (gender, age group)
- Geographic analysis (top 5 states by churn rate)
- Contract and payment method analysis
- Service usage patterns
- Churn distribution by category

#### Prediction Dashboard
- Predicted churners from **Joined customers** (248 female, 133 male = 381 total)
- At-risk customer segmentation by:
  - Age group
  - Marital status
  - Tenure
  - State
  - Payment method
  - Contract type
- Detailed customer list with risk indicators

### 3. Machine Learning Model

**Methodology**:
- **Training Data**: Customers with status 'Churned' or 'Stayed' (historical data with known outcomes)
- **Prediction Data**: Customers with status 'Joined' (new customers without churn history)
- **Model**: Random Forest Classifier trained on historical churn patterns
- **Features Used**:
  - Customer demographics (age, gender, marital status)
  - Service usage patterns
  - Contract details
  - Payment behavior
  - Tenure and engagement metrics
  
The model learns from past customer behavior (Churned vs Stayed) to predict which newly joined customers are at risk of churning.

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

## 🔄 Machine Learning Workflow

1. **Training Phase**:
   - Input: Historical customers (Churned + Stayed status)
   - Features: Demographics, services, contract, payment patterns
   - Target: Customer_Status (Churned = 1, Stayed = 0)
   - Output: Trained Random Forest model

2. **Prediction Phase**:
   - Input: New customers (Joined status)
   - Process: Apply trained model to predict churn probability
   - Output: 381 customers identified as high churn risk

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



---

**Note**: This analysis is based on historical data and should be combined with domain expertise for strategic decision-making.
