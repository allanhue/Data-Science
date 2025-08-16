{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "e1da6cee",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2025-08-16T07:34:59.457982Z",
     "iopub.status.busy": "2025-08-16T07:34:59.455708Z",
     "iopub.status.idle": "2025-08-16T07:35:00.909383Z",
     "shell.execute_reply": "2025-08-16T07:35:00.907388Z"
    },
    "papermill": {
     "duration": 1.461295,
     "end_time": "2025-08-16T07:35:00.912021",
     "exception": false,
     "start_time": "2025-08-16T07:34:59.450726",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.4     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.5\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.5.1     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.3     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.2     \n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "'uber-ride-analytics-dashboard'"
      ],
      "text/latex": [
       "'uber-ride-analytics-dashboard'"
      ],
      "text/markdown": [
       "'uber-ride-analytics-dashboard'"
      ],
      "text/plain": [
       "[1] \"uber-ride-analytics-dashboard\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# This R environment comes with many helpful analytics packages installed\n",
    "# It is defined by the kaggle/rstats Docker image: https://github.com/kaggle/docker-rstats\n",
    "# For example, here's a helpful package to load\n",
    "\n",
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "\n",
    "# Input data files are available in the read-only \"../input/\" directory\n",
    "# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory\n",
    "\n",
    "list.files(path = \"../input\")\n",
    "\n",
    "# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using \"Save & Run All\" \n",
    "# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "38638b78",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-08-16T07:35:00.951218Z",
     "iopub.status.busy": "2025-08-16T07:35:00.918809Z",
     "iopub.status.idle": "2025-08-16T07:35:02.254494Z",
     "shell.execute_reply": "2025-08-16T07:35:02.252469Z"
    },
    "papermill": {
     "duration": 1.342782,
     "end_time": "2025-08-16T07:35:02.257354",
     "exception": false,
     "start_time": "2025-08-16T07:35:00.914572",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m150000\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m21\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (19): Booking ID, Booking Status, Customer ID, Vehicle Type, Pickup Loc...\n",
      "\u001b[34mdate\u001b[39m  (1): Date\n",
      "\u001b[34mtime\u001b[39m  (1): Time\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 21</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Date</th><th scope=col>Time</th><th scope=col>Booking ID</th><th scope=col>Booking Status</th><th scope=col>Customer ID</th><th scope=col>Vehicle Type</th><th scope=col>Pickup Location</th><th scope=col>Drop Location</th><th scope=col>Avg VTAT</th><th scope=col>Avg CTAT</th><th scope=col>⋯</th><th scope=col>Reason for cancelling by Customer</th><th scope=col>Cancelled Rides by Driver</th><th scope=col>Driver Cancellation Reason</th><th scope=col>Incomplete Rides</th><th scope=col>Incomplete Rides Reason</th><th scope=col>Booking Value</th><th scope=col>Ride Distance</th><th scope=col>Driver Ratings</th><th scope=col>Customer Rating</th><th scope=col>Payment Method</th></tr>\n",
       "\t<tr><th scope=col>&lt;date&gt;</th><th scope=col>&lt;time&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>⋯</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>2024-03-23</td><td>12:29:38</td><td>\"CNR5884300\"</td><td>No Driver Found</td><td>\"CID1982111\"</td><td>eBike        </td><td>Palam Vihar        </td><td>Jhilmil          </td><td>null</td><td>null</td><td>⋯</td><td>null</td><td>null</td><td>null</td><td>null</td><td>null             </td><td>null</td><td>null </td><td>null</td><td>null</td><td>null      </td></tr>\n",
       "\t<tr><td>2024-11-29</td><td>18:01:39</td><td>\"CNR1326809\"</td><td>Incomplete     </td><td>\"CID4604802\"</td><td>Go Sedan     </td><td>Shastri Nagar      </td><td>Gurgaon Sector 56</td><td>4.9 </td><td>14.0</td><td>⋯</td><td>null</td><td>null</td><td>null</td><td>1   </td><td>Vehicle Breakdown</td><td>237 </td><td>5.73 </td><td>null</td><td>null</td><td>UPI       </td></tr>\n",
       "\t<tr><td>2024-08-23</td><td>08:56:10</td><td>\"CNR8494506\"</td><td>Completed      </td><td>\"CID9202816\"</td><td>Auto         </td><td>Khandsa            </td><td>Malviya Nagar    </td><td>13.4</td><td>25.8</td><td>⋯</td><td>null</td><td>null</td><td>null</td><td>null</td><td>null             </td><td>627 </td><td>13.58</td><td>4.9 </td><td>4.9 </td><td>Debit Card</td></tr>\n",
       "\t<tr><td>2024-10-21</td><td>17:17:25</td><td>\"CNR8906825\"</td><td>Completed      </td><td>\"CID2610914\"</td><td>Premier Sedan</td><td>Central Secretariat</td><td>Inderlok         </td><td>13.1</td><td>28.5</td><td>⋯</td><td>null</td><td>null</td><td>null</td><td>null</td><td>null             </td><td>416 </td><td>34.02</td><td>4.6 </td><td>5.0 </td><td>UPI       </td></tr>\n",
       "\t<tr><td>2024-09-16</td><td>22:08:00</td><td>\"CNR1950162\"</td><td>Completed      </td><td>\"CID9933542\"</td><td>Bike         </td><td>Ghitorni Village   </td><td>Khan Market      </td><td>5.3 </td><td>19.6</td><td>⋯</td><td>null</td><td>null</td><td>null</td><td>null</td><td>null             </td><td>737 </td><td>48.21</td><td>4.1 </td><td>4.3 </td><td>UPI       </td></tr>\n",
       "\t<tr><td>2024-02-06</td><td>09:44:56</td><td>\"CNR4096693\"</td><td>Completed      </td><td>\"CID4670564\"</td><td>Auto         </td><td>AIIMS              </td><td>Narsinghpur      </td><td>5.1 </td><td>18.1</td><td>⋯</td><td>null</td><td>null</td><td>null</td><td>null</td><td>null             </td><td>316 </td><td>4.85 </td><td>4.1 </td><td>4.6 </td><td>UPI       </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 21\n",
       "\\begin{tabular}{lllllllllllllllllllll}\n",
       " Date & Time & Booking ID & Booking Status & Customer ID & Vehicle Type & Pickup Location & Drop Location & Avg VTAT & Avg CTAT & ⋯ & Reason for cancelling by Customer & Cancelled Rides by Driver & Driver Cancellation Reason & Incomplete Rides & Incomplete Rides Reason & Booking Value & Ride Distance & Driver Ratings & Customer Rating & Payment Method\\\\\n",
       " <date> & <time> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & ⋯ & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t 2024-03-23 & 12:29:38 & \"CNR5884300\" & No Driver Found & \"CID1982111\" & eBike         & Palam Vihar         & Jhilmil           & null & null & ⋯ & null & null & null & null & null              & null & null  & null & null & null      \\\\\n",
       "\t 2024-11-29 & 18:01:39 & \"CNR1326809\" & Incomplete      & \"CID4604802\" & Go Sedan      & Shastri Nagar       & Gurgaon Sector 56 & 4.9  & 14.0 & ⋯ & null & null & null & 1    & Vehicle Breakdown & 237  & 5.73  & null & null & UPI       \\\\\n",
       "\t 2024-08-23 & 08:56:10 & \"CNR8494506\" & Completed       & \"CID9202816\" & Auto          & Khandsa             & Malviya Nagar     & 13.4 & 25.8 & ⋯ & null & null & null & null & null              & 627  & 13.58 & 4.9  & 4.9  & Debit Card\\\\\n",
       "\t 2024-10-21 & 17:17:25 & \"CNR8906825\" & Completed       & \"CID2610914\" & Premier Sedan & Central Secretariat & Inderlok          & 13.1 & 28.5 & ⋯ & null & null & null & null & null              & 416  & 34.02 & 4.6  & 5.0  & UPI       \\\\\n",
       "\t 2024-09-16 & 22:08:00 & \"CNR1950162\" & Completed       & \"CID9933542\" & Bike          & Ghitorni Village    & Khan Market       & 5.3  & 19.6 & ⋯ & null & null & null & null & null              & 737  & 48.21 & 4.1  & 4.3  & UPI       \\\\\n",
       "\t 2024-02-06 & 09:44:56 & \"CNR4096693\" & Completed       & \"CID4670564\" & Auto          & AIIMS               & Narsinghpur       & 5.1  & 18.1 & ⋯ & null & null & null & null & null              & 316  & 4.85  & 4.1  & 4.6  & UPI       \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 21\n",
       "\n",
       "| Date &lt;date&gt; | Time &lt;time&gt; | Booking ID &lt;chr&gt; | Booking Status &lt;chr&gt; | Customer ID &lt;chr&gt; | Vehicle Type &lt;chr&gt; | Pickup Location &lt;chr&gt; | Drop Location &lt;chr&gt; | Avg VTAT &lt;chr&gt; | Avg CTAT &lt;chr&gt; | ⋯ ⋯ | Reason for cancelling by Customer &lt;chr&gt; | Cancelled Rides by Driver &lt;chr&gt; | Driver Cancellation Reason &lt;chr&gt; | Incomplete Rides &lt;chr&gt; | Incomplete Rides Reason &lt;chr&gt; | Booking Value &lt;chr&gt; | Ride Distance &lt;chr&gt; | Driver Ratings &lt;chr&gt; | Customer Rating &lt;chr&gt; | Payment Method &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 2024-03-23 | 12:29:38 | \"CNR5884300\" | No Driver Found | \"CID1982111\" | eBike         | Palam Vihar         | Jhilmil           | null | null | ⋯ | null | null | null | null | null              | null | null  | null | null | null       |\n",
       "| 2024-11-29 | 18:01:39 | \"CNR1326809\" | Incomplete      | \"CID4604802\" | Go Sedan      | Shastri Nagar       | Gurgaon Sector 56 | 4.9  | 14.0 | ⋯ | null | null | null | 1    | Vehicle Breakdown | 237  | 5.73  | null | null | UPI        |\n",
       "| 2024-08-23 | 08:56:10 | \"CNR8494506\" | Completed       | \"CID9202816\" | Auto          | Khandsa             | Malviya Nagar     | 13.4 | 25.8 | ⋯ | null | null | null | null | null              | 627  | 13.58 | 4.9  | 4.9  | Debit Card |\n",
       "| 2024-10-21 | 17:17:25 | \"CNR8906825\" | Completed       | \"CID2610914\" | Premier Sedan | Central Secretariat | Inderlok          | 13.1 | 28.5 | ⋯ | null | null | null | null | null              | 416  | 34.02 | 4.6  | 5.0  | UPI        |\n",
       "| 2024-09-16 | 22:08:00 | \"CNR1950162\" | Completed       | \"CID9933542\" | Bike          | Ghitorni Village    | Khan Market       | 5.3  | 19.6 | ⋯ | null | null | null | null | null              | 737  | 48.21 | 4.1  | 4.3  | UPI        |\n",
       "| 2024-02-06 | 09:44:56 | \"CNR4096693\" | Completed       | \"CID4670564\" | Auto          | AIIMS               | Narsinghpur       | 5.1  | 18.1 | ⋯ | null | null | null | null | null              | 316  | 4.85  | 4.1  | 4.6  | UPI        |\n",
       "\n"
      ],
      "text/plain": [
       "  Date       Time     Booking ID   Booking Status  Customer ID  Vehicle Type \n",
       "1 2024-03-23 12:29:38 \"CNR5884300\" No Driver Found \"CID1982111\" eBike        \n",
       "2 2024-11-29 18:01:39 \"CNR1326809\" Incomplete      \"CID4604802\" Go Sedan     \n",
       "3 2024-08-23 08:56:10 \"CNR8494506\" Completed       \"CID9202816\" Auto         \n",
       "4 2024-10-21 17:17:25 \"CNR8906825\" Completed       \"CID2610914\" Premier Sedan\n",
       "5 2024-09-16 22:08:00 \"CNR1950162\" Completed       \"CID9933542\" Bike         \n",
       "6 2024-02-06 09:44:56 \"CNR4096693\" Completed       \"CID4670564\" Auto         \n",
       "  Pickup Location     Drop Location     Avg VTAT Avg CTAT ⋯\n",
       "1 Palam Vihar         Jhilmil           null     null     ⋯\n",
       "2 Shastri Nagar       Gurgaon Sector 56 4.9      14.0     ⋯\n",
       "3 Khandsa             Malviya Nagar     13.4     25.8     ⋯\n",
       "4 Central Secretariat Inderlok          13.1     28.5     ⋯\n",
       "5 Ghitorni Village    Khan Market       5.3      19.6     ⋯\n",
       "6 AIIMS               Narsinghpur       5.1      18.1     ⋯\n",
       "  Reason for cancelling by Customer Cancelled Rides by Driver\n",
       "1 null                              null                     \n",
       "2 null                              null                     \n",
       "3 null                              null                     \n",
       "4 null                              null                     \n",
       "5 null                              null                     \n",
       "6 null                              null                     \n",
       "  Driver Cancellation Reason Incomplete Rides Incomplete Rides Reason\n",
       "1 null                       null             null                   \n",
       "2 null                       1                Vehicle Breakdown      \n",
       "3 null                       null             null                   \n",
       "4 null                       null             null                   \n",
       "5 null                       null             null                   \n",
       "6 null                       null             null                   \n",
       "  Booking Value Ride Distance Driver Ratings Customer Rating Payment Method\n",
       "1 null          null          null           null            null          \n",
       "2 237           5.73          null           null            UPI           \n",
       "3 627           13.58         4.9            4.9             Debit Card    \n",
       "4 416           34.02         4.6            5.0             UPI           \n",
       "5 737           48.21         4.1            4.3             UPI           \n",
       "6 316           4.85          4.1            4.6             UPI           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# read the files and then print the first few rows \n",
    "uber_data <- read_csv('/kaggle/input/uber-ride-analytics-dashboard/ncr_ride_bookings.csv')\n",
    "# print the firt few rows\n",
    "head(uber_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "e623ca15",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-08-16T07:35:02.267510Z",
     "iopub.status.busy": "2025-08-16T07:35:02.265671Z",
     "iopub.status.idle": "2025-08-16T07:35:02.773202Z",
     "shell.execute_reply": "2025-08-16T07:35:02.770352Z"
    },
    "papermill": {
     "duration": 0.515503,
     "end_time": "2025-08-16T07:35:02.775838",
     "exception": false,
     "start_time": "2025-08-16T07:35:02.260335",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# dropping the clomns with null \n",
    "?summarise(uber_data)\n",
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "ef253a62",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-08-16T07:35:02.785254Z",
     "iopub.status.busy": "2025-08-16T07:35:02.783611Z",
     "iopub.status.idle": "2025-08-16T07:35:02.827454Z",
     "shell.execute_reply": "2025-08-16T07:35:02.825470Z"
    },
    "papermill": {
     "duration": 0.051194,
     "end_time": "2025-08-16T07:35:02.829913",
     "exception": false,
     "start_time": "2025-08-16T07:35:02.778719",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "spc_tbl_ [150,000 × 21] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ Date                             : Date[1:150000], format: \"2024-03-23\" \"2024-11-29\" ...\n",
      " $ Time                             : 'hms' num [1:150000] 12:29:38 18:01:39 08:56:10 17:17:25 ...\n",
      "  ..- attr(*, \"units\")= chr \"secs\"\n",
      " $ Booking ID                       : chr [1:150000] \"\\\"CNR5884300\\\"\" \"\\\"CNR1326809\\\"\" \"\\\"CNR8494506\\\"\" \"\\\"CNR8906825\\\"\" ...\n",
      " $ Booking Status                   : chr [1:150000] \"No Driver Found\" \"Incomplete\" \"Completed\" \"Completed\" ...\n",
      " $ Customer ID                      : chr [1:150000] \"\\\"CID1982111\\\"\" \"\\\"CID4604802\\\"\" \"\\\"CID9202816\\\"\" \"\\\"CID2610914\\\"\" ...\n",
      " $ Vehicle Type                     : chr [1:150000] \"eBike\" \"Go Sedan\" \"Auto\" \"Premier Sedan\" ...\n",
      " $ Pickup Location                  : chr [1:150000] \"Palam Vihar\" \"Shastri Nagar\" \"Khandsa\" \"Central Secretariat\" ...\n",
      " $ Drop Location                    : chr [1:150000] \"Jhilmil\" \"Gurgaon Sector 56\" \"Malviya Nagar\" \"Inderlok\" ...\n",
      " $ Avg VTAT                         : chr [1:150000] \"null\" \"4.9\" \"13.4\" \"13.1\" ...\n",
      " $ Avg CTAT                         : chr [1:150000] \"null\" \"14.0\" \"25.8\" \"28.5\" ...\n",
      " $ Cancelled Rides by Customer      : chr [1:150000] \"null\" \"null\" \"null\" \"null\" ...\n",
      " $ Reason for cancelling by Customer: chr [1:150000] \"null\" \"null\" \"null\" \"null\" ...\n",
      " $ Cancelled Rides by Driver        : chr [1:150000] \"null\" \"null\" \"null\" \"null\" ...\n",
      " $ Driver Cancellation Reason       : chr [1:150000] \"null\" \"null\" \"null\" \"null\" ...\n",
      " $ Incomplete Rides                 : chr [1:150000] \"null\" \"1\" \"null\" \"null\" ...\n",
      " $ Incomplete Rides Reason          : chr [1:150000] \"null\" \"Vehicle Breakdown\" \"null\" \"null\" ...\n",
      " $ Booking Value                    : chr [1:150000] \"null\" \"237\" \"627\" \"416\" ...\n",
      " $ Ride Distance                    : chr [1:150000] \"null\" \"5.73\" \"13.58\" \"34.02\" ...\n",
      " $ Driver Ratings                   : chr [1:150000] \"null\" \"null\" \"4.9\" \"4.6\" ...\n",
      " $ Customer Rating                  : chr [1:150000] \"null\" \"null\" \"4.9\" \"5.0\" ...\n",
      " $ Payment Method                   : chr [1:150000] \"null\" \"UPI\" \"Debit Card\" \"UPI\" ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   Date = \u001b[34mcol_date(format = \"\")\u001b[39m,\n",
      "  ..   Time = \u001b[34mcol_time(format = \"\")\u001b[39m,\n",
      "  ..   `Booking ID` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `Booking Status` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `Customer ID` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `Vehicle Type` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `Pickup Location` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `Drop Location` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `Avg VTAT` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `Avg CTAT` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `Cancelled Rides by Customer` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `Reason for cancelling by Customer` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `Cancelled Rides by Driver` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `Driver Cancellation Reason` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `Incomplete Rides` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `Incomplete Rides Reason` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `Booking Value` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `Ride Distance` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `Driver Ratings` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `Customer Rating` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `Payment Method` = \u001b[31mcol_character()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n"
     ]
    }
   ],
   "source": [
    "# drop null and groupb by\n",
    "# get datatypes \n",
    "str(uber_data)\n",
    "  \n",
    "# get the summary of dataset\n",
    "# summarise(uber_data)\n",
    "# # work on the dataset malnupulation and wrangling\n",
    "# library(dplyr)\n",
    "# uber_data %>%\n",
    "#   group_by(Date) %>%\n",
    "#   summarise(\n",
    "#     Count = n(),\n",
    "#     Avg_Fare = mean(Fare, na.rm = TRUE),\n",
    "#     Avg_Distance = mean(Distance, na.rm = TRUE)\n",
    "#   )\n",
    "# uber_data\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "ae08e023",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-08-16T07:35:02.839546Z",
     "iopub.status.busy": "2025-08-16T07:35:02.837948Z",
     "iopub.status.idle": "2025-08-16T07:35:03.324121Z",
     "shell.execute_reply": "2025-08-16T07:35:03.322314Z"
    },
    "papermill": {
     "duration": 0.493816,
     "end_time": "2025-08-16T07:35:03.326704",
     "exception": false,
     "start_time": "2025-08-16T07:35:02.832888",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "tibble [150,000 × 21] (S3: tbl_df/tbl/data.frame)\n",
      " $ Date                             : Date[1:150000], format: \"2024-03-23\" \"2024-11-29\" ...\n",
      " $ Time                             : 'hms' num [1:150000] 12:29:38 18:01:39 08:56:10 17:17:25 ...\n",
      "  ..- attr(*, \"units\")= chr \"secs\"\n",
      " $ Booking ID                       : chr [1:150000] \"\\\"CNR5884300\\\"\" \"\\\"CNR1326809\\\"\" \"\\\"CNR8494506\\\"\" \"\\\"CNR8906825\\\"\" ...\n",
      " $ Booking Status                   : Factor w/ 5 levels \"Cancelled by Customer\",..: 5 4 3 3 3 3 3 3 5 4 ...\n",
      " $ Customer ID                      : chr [1:150000] \"\\\"CID1982111\\\"\" \"\\\"CID4604802\\\"\" \"\\\"CID9202816\\\"\" \"\\\"CID2610914\\\"\" ...\n",
      " $ Vehicle Type                     : chr [1:150000] \"eBike\" \"Go Sedan\" \"Auto\" \"Premier Sedan\" ...\n",
      " $ Pickup Location                  : chr [1:150000] \"Palam Vihar\" \"Shastri Nagar\" \"Khandsa\" \"Central Secretariat\" ...\n",
      " $ Drop Location                    : chr [1:150000] \"Jhilmil\" \"Gurgaon Sector 56\" \"Malviya Nagar\" \"Inderlok\" ...\n",
      " $ Avg VTAT                         : num [1:150000] NA 4.9 13.4 13.1 5.3 5.1 7.1 12.1 NA 6.1 ...\n",
      " $ Avg CTAT                         : num [1:150000] NA 14 25.8 28.5 19.6 18.1 20.4 16.5 NA 26 ...\n",
      " $ Cancelled Rides by Customer      : num [1:150000] NA NA NA NA NA NA NA NA NA NA ...\n",
      " $ Reason for cancelling by Customer: chr [1:150000] \"null\" \"null\" \"null\" \"null\" ...\n",
      " $ Cancelled Rides by Driver        : num [1:150000] NA NA NA NA NA NA NA NA NA NA ...\n",
      " $ Driver Cancellation Reason       : chr [1:150000] \"null\" \"null\" \"null\" \"null\" ...\n",
      " $ Incomplete Rides                 : num [1:150000] NA 1 NA NA NA NA NA NA NA 1 ...\n",
      " $ Incomplete Rides Reason          : chr [1:150000] \"null\" \"Vehicle Breakdown\" \"null\" \"null\" ...\n",
      " $ Booking Value                    : num [1:150000] NA 237 627 416 737 316 640 136 NA 135 ...\n",
      " $ Ride Distance                    : num [1:150000] NA 5.73 13.58 34.02 48.21 ...\n",
      " $ Driver Ratings                   : num [1:150000] NA NA 4.9 4.6 4.1 4.1 4 4.4 NA NA ...\n",
      " $ Customer Rating                  : num [1:150000] NA NA 4.9 5 4.3 4.6 4.1 4.2 NA NA ...\n",
      " $ Payment Method                   : chr [1:150000] \"null\" \"UPI\" \"Debit Card\" \"UPI\" ...\n"
     ]
    }
   ],
   "source": [
    "library(dplyr)\n",
    "\n",
    "# Clean the dataset\n",
    "uber_data_clean <- uber_data %>%\n",
    "  mutate(\n",
    "    # Convert \"null\" to NA across relevant columns\n",
    "    across(c(`Booking Value`, `Ride Distance`, `Avg VTAT`, `Avg CTAT`, \n",
    "             `Driver Ratings`, `Customer Rating`, \n",
    "             `Cancelled Rides by Customer`, `Cancelled Rides by Driver`, \n",
    "             `Incomplete Rides`), \n",
    "           ~ na_if(.x, \"null\")),\n",
    "    # Convert character columns to numeric\n",
    "    `Booking Value` = as.numeric(`Booking Value`),\n",
    "    `Ride Distance` = as.numeric(`Ride Distance`),\n",
    "    `Avg VTAT` = as.numeric(`Avg VTAT`),\n",
    "    `Avg CTAT` = as.numeric(`Avg CTAT`),\n",
    "    `Driver Ratings` = as.numeric(`Driver Ratings`),\n",
    "    `Customer Rating` = as.numeric(`Customer Rating`),\n",
    "    `Cancelled Rides by Customer` = as.numeric(`Cancelled Rides by Customer`),\n",
    "    `Cancelled Rides by Driver` = as.numeric(`Cancelled Rides by Driver`),\n",
    "    `Incomplete Rides` = as.numeric(`Incomplete Rides`),\n",
    "    # Convert Booking Status to factor\n",
    "    `Booking Status` = as.factor(`Booking Status`),\n",
    "    # Ensure Date is Date type (already correct, but just to confirm)\n",
    "    Date = as.Date(Date),\n",
    "    # Convert Time to hms (already in hms format, but ensure consistency)\n",
    "    Time = hms::as_hms(Time)\n",
    "  )\n",
    "\n",
    "# Check the structure of the cleaned dataset\n",
    "str(uber_data_clean)\n",
    "daily_summary <- uber_data_clean %>%\n",
    "  group_by(Date)\n",
    "  \n"
   ]
  }
 ],
 "metadata": {
  "kaggle": {
   "accelerator": "none",
   "dataSources": [
    {
     "datasetId": 8032385,
     "sourceId": 12709507,
     "sourceType": "datasetVersion"
    }
   ],
   "dockerImageVersionId": 30749,
   "isGpuEnabled": false,
   "isInternetEnabled": true,
   "language": "r",
   "sourceType": "notebook"
  },
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.4.0"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 7.587414,
   "end_time": "2025-08-16T07:35:03.451831",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2025-08-16T07:34:55.864417",
   "version": "2.6.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
