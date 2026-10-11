@Entry
@Component
struct WeLinkPunchCard {
  @State isPunched: boolean = false;
  @State currentTime: string = '';
  build() {
    RelativeContainer() {
      Button({ type: ButtonType.Circle, stateEffect: true }) {
        if (!this.isPunched) {
          Column({ space: 2 }) {
            Text('')
              .fontSize(24)
              .fontColor(Color.White)
            Text('点击打卡')
              .fontSize(12)
              .fontColor(Color.White)
          }
        } else {
          Column({ space: 2 }) {
            Text('✓')
              .fontSize(32)
              .fontColor(Color.White)
              .fontWeight(FontWeight.Bold)
            Text('打卡成功')
              .fontSize(12)
              .fontColor(Color.White)
          }
        }
      }
      .id('PunchButton')
      .width(100)
      .height(100)
      .backgroundColor(Color.Green)
      .alignRules({
        center: { anchor: '__container__', align: VerticalAlign.Center },
        middle: { anchor: '__container__', align: HorizontalAlign.Center }
      })
      .onClick(() => {
        this.isPunched = true;
        this.updateTime();
      })
      if (!this.isPunched) {
        Text(this.currentTime)
          .id('TimeText')
          .fontSize(24)
          .fontColor(Color.Black)
          .alignRules({
            top: { anchor: 'PunchButton', align: VerticalAlign.Bottom },
            middle: { anchor: 'PunchButton', align: HorizontalAlign.Center }
          })
          .margin({ top: 20 })
      } else {
        Text('华为坂田基地')
          .id('LocationText')
          .fontSize(16)
          .fontColor(Color.Black)
          .alignRules({
            top: { anchor: 'PunchButton', align: VerticalAlign.Bottom },
            middle: { anchor: 'PunchButton', align: HorizontalAlign.Center }
          })
          .margin({ top: 20 })
        Text(this.currentTime)
          .id('TimeTextAfter')
          .fontSize(16)
          .fontColor(Color.Black)
          .alignRules({
            top: { anchor: 'LocationText', align: VerticalAlign.Bottom },
            middle: { anchor: 'LocationText', align: HorizontalAlign.Center }
          })
          .margin({ top: 5 })
      }
    }
    .height('100%')
    .width('100%')
    .backgroundColor(Color.White)
  }
  aboutToAppear() {
    this.updateTime();
    setInterval(() => {
      this.updateTime();
    }, 1000);
  }
  updateTime() {
    const now = new Date();
    const hours = now.getHours().toString().padStart(2, '0');
    const minutes = now.getMinutes().toString().padStart(2, '0');
    const seconds = now.getSeconds().toString().padStart(2, '0');
    this.currentTime = `${hours}:${minutes}:${seconds}`;
  }
}