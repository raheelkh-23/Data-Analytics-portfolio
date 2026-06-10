import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load data
df = pd.read_csv("train.csv")

# STEP 1 — What does the data look like?
print("=== DATASET OVERVIEW ===")
print("Shape:", df.shape)
print("\nColumns:", df.columns.tolist())
print("\nData types:")
print(df.dtypes)
# STEP 2 — Missing values
print("\n=== MISSING VALUES ===")
print(df.isnull().sum())
print("\nMissing percentage:")
print((df.isnull().sum() / len(df) * 100).round(2))
# STEP 3 — Duplicates
print("\n=== DUPLICATES ===")
print("Duplicate rows:", df.duplicated().sum())
print("Unique Order IDs:", df['Order ID'].nunique())
print("Unique Customers:", df['Customer Name'].nunique())
print("Unique Products:", df['Product Name'].nunique())
# STEP 4 — Sales distribution
print("\n=== SALES DISTRIBUTION ===")
print(df['Sales'].describe())
print("\nSkewness:", df['Sales'].skew().round(2))
print("Kurtosis:", df['Sales'].kurt().round(2))
# STEP 5 — Category analysis
print("\n=== CATEGORY ANALYSIS ===")
category_stats = df.groupby('Category')['Sales'].agg(['sum', 'mean', 'count', 'median'])
category_stats.columns = ['Total Sales', 'Avg Sale', 'Orders', 'Median Sale']
category_stats = category_stats.sort_values('Total Sales', ascending=False)
print(category_stats)
# STEP 6 — EDA Visualization
fig, axes = plt.subplots(2, 2, figsize=(14, 10))
fig.suptitle('Superstore EDA Dashboard', fontsize=18, fontweight='bold')

# Chart 1 — Sales distribution
axes[0,0].hist(df['Sales'], bins=50, color='steelblue', edgecolor='white')
axes[0,0].set_title('Sales Distribution')
axes[0,0].set_xlabel('Sales ($)')
axes[0,0].set_ylabel('Frequency')

# Chart 2 — Category total sales
category_sales = df.groupby('Category')['Sales'].sum()
axes[0,1].bar(category_sales.index, category_sales.values, color=['#2ecc71','#3498db','#e74c3c'])
axes[0,1].set_title('Total Sales by Category')
axes[0,1].set_xlabel('Category')
axes[0,1].set_ylabel('Total Sales ($)')

# Chart 3 — Region sales
region_sales = df.groupby('Region')['Sales'].sum().sort_values(ascending=False)
axes[1,0].bar(region_sales.index, region_sales.values, color='coral')
axes[1,0].set_title('Total Sales by Region')
axes[1,0].set_xlabel('Region')
axes[1,0].set_ylabel('Total Sales ($)')

# Chart 4 — Top 10 customers
top_customers = df.groupby('Customer Name')['Sales'].sum().sort_values(ascending=False).head(10)
axes[1,1].barh(top_customers.index, top_customers.values, color='mediumpurple')
axes[1,1].set_title('Top 10 Customers')
axes[1,1].set_xlabel('Total Sales ($)')

plt.tight_layout()
plt.show()
