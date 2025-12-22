# 가상환경 들어가기: .venv\Scripts\activate
# pip 업그레이드: python -m pip install --upgrade pip
# pip install statsmodels joblib
# pip install xlwings
# pip install flask

# .ignore파일에 .venv/추가

# pip freeze > requirments.txt
# reqiurements.txt 팀원끼리 공유
# requirements.txt 있는 라이브러리를 똑같이 설치 : pip install -r reqiurements.txt




import joblib
loaded_model= joblib.load('model/apt.joblib')

def predict_apt_price(year, square, floor):
  
  input_data= [[int(year), int(square), int(floor),1]]
  result= round(loaded_model.predict(input_data)[0] * 10000)
  return format(result, ',') + '원입니다'

if __name__ == "__main__":
  year=input('건축년도')
  square= input('몇 제곱?')
  floor= input('몇 층?')
  print("예측한 금액은? ",predict_apt_price(year, square, floor))