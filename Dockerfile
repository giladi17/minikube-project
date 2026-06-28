# --- Stage 1: Builder ---
# משתמשים בגרסת Alpine רזה כדי להוריד תלויות ולבנות את הקוד
FROM node:20-alpine AS builder
WORKDIR /usr/src/app

# העתקת קבצי ניהול החבילות מתוך תיקיית src
COPY src/package*.json ./
RUN npm ci --omit=dev

# העתקת שאר קוד האפליקציה מתוך תיקיית src
COPY src/ ./src

# --- Stage 2: Runtime (Production) ---
# מתחילים שוב מאימג' נקי לחלוטין כדי לזרוק את כלי הפיתוח
FROM node:20-alpine
WORKDIR /usr/src/app

# יצירת משתמש וקבוצה ללא הרשאות מנהל (Security Best Practice)
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# העתקת התוצרים המוכנים משלב ה-builder ושינוי הבעלות למשתמש החדש
COPY --from=builder --chown=appuser:appgroup /usr/src/app/node_modules ./node_modules
COPY --from=builder --chown=appuser:appgroup /usr/src/app/package.json ./
COPY --from=builder --chown=appuser:appgroup /usr/src/app/src ./src 
# (בהנחה שקוד המקור יושב בתיקיית src)

# מעבר למשתמש הלא-מועדף לפני הרצת האפליקציה
USER appuser

# חשיפת הפורט
EXPOSE 3000

# פקודת ההפעלה
CMD ["npm", "start"]