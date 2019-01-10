package com.xh.xiaoyiduo.admin.utils;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.awt.image.CropImageFilter;
import java.awt.image.FilteredImageSource;
import java.awt.image.ImageFilter;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import javax.imageio.ImageIO;


public class newImageCut {

    /**
     * 截取图片
     *
     * @param srcImageFile 原图片地址
     * @param x            截取时的x坐标
     * @param y            截取时的y坐标
     * @param desWidth     截取的宽度
     * @param desHeight    截取的高度
     */

    public static void imgCut(ByteArrayOutputStream baos, InputStream input, String srcImageFile, int x, int y, int desWidth,

                              int desHeight) {

        try {

            Image img; //申明裁剪后的图片

            ImageFilter cropFilter; //申明图片过滤器

            BufferedImage bi = ImageIO.read(input); //创建图片缓存区，读取图片的输入流

            /*BufferedImage bi = ImageIO.read(new File(srcImageFile+"_src.jpg"));*/

            int srcWidth = bi.getWidth(); //原图片宽度

            int srcHeight = bi.getHeight(); //原图片高度

            if (srcWidth >= desWidth && srcHeight >= desHeight) { //比较原图与裁剪图的长宽

                Image image = bi.getScaledInstance(srcWidth, srcHeight, Image.SCALE_DEFAULT); //获取原图片

                cropFilter = new CropImageFilter(x, y, desWidth, desHeight); //过滤，裁剪尺寸

                img = Toolkit.getDefaultToolkit().createImage(

                        new FilteredImageSource(image.getSource(), cropFilter)); //裁剪后的图片

                BufferedImage tag = new BufferedImage(desWidth, desHeight, //将裁剪好后的图片放到图片缓存区

                        BufferedImage.TYPE_INT_RGB);

                Graphics g = tag.getGraphics(); //得到图形

                g.drawImage(img, 0, 0, null); // 画图

                g.dispose(); // 处理

                //输出文件

//                ImageIO.write(tag, "JPEG", new File(srcImageFile+"_cut.jpg"));

                ImageIO.write(tag, "JPEG", baos);

                input.close();
            }

        } catch (Exception e) {

            e.printStackTrace();

        }

    }

}