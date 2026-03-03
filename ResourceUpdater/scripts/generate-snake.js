const fs = require('fs');
const path = require('path');

(async () => {
  try {
    // 直接导入源代码模块
    const { generateContributionSnake } = await import('file:///snk/packages/action/generateContributionSnake.ts');

    const userName = process.env.GITHUB_USER || 'Miuzarte';
    const outputPath = process.env.OUTPUT_PATH || '/app/output/snk';

    // 从环境变量解析颜色配置
    const lightDots = (process.env.SNAKE_LIGHT_DOTS || '#eff2f5,#aceebb,#4ac26b,#2da44e,#116329').split(',');
    const darkDots = (process.env.SNAKE_DARK_DOTS || '#151b23,#033a16,#196c2e,#2ea043,#56d364').split(',');

    // 定义输出配置 - 使用 snk 期望的格式
    const outputs = [
      {
        format: 'svg',
        drawOptions: {
          colorSnake: process.env.SNAKE_LIGHT_COLOR || '#5184F0',
          colorDots: lightDots,
          colorEmpty: lightDots[0],
          sizeDotBorderRadius: 2,
          sizeCell: 16,
          sizeDot: 12,
        },
        animationOptions: {
          frameByStep: 1,
          stepDurationMs: 100,
        }
      },
      {
        format: 'svg',
        drawOptions: {
          colorSnake: process.env.SNAKE_DARK_COLOR || '#E5289E',
          colorDots: darkDots,
          colorEmpty: darkDots[0],
          sizeDotBorderRadius: 2,
          sizeCell: 16,
          sizeDot: 12,
        },
        animationOptions: {
          frameByStep: 1,
          stepDurationMs: 100,
        }
      }
    ];

    const filenames = [
      path.join(outputPath, 'snake-light.svg'),
      path.join(outputPath, 'snake-dark.svg')
    ];

    console.log(`Generating snake for user: ${userName}`);

    const results = await generateContributionSnake(userName, outputs, {
      githubToken: process.env.GITHUB_TOKEN
    });

    console.log(`Results type: ${typeof results}, length: ${results?.length}`);

    results.forEach((result, i) => {
      console.log(`Result ${i}: type=${typeof result}, length=${result?.length}, hasContent=${!!result}`);
      if (result) {
        const filename = filenames[i];
        console.log(`Writing to ${filename}`);
        fs.mkdirSync(path.dirname(filename), { recursive: true });
        fs.writeFileSync(filename, result);
        console.log(`Written ${result.length} bytes`);
      } else {
        console.log(`Skipping ${filenames[i]}: no result`);
      }
    });

    console.log('Snake generation completed!');
  } catch (e) {
    console.error('Error:', e.message);
    console.error(e.stack);
    process.exit(1);
  }
})();
