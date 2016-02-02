package gnnt.trade.bank.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * 文件操作工具类
 * @author tanglt  2011-5-29
 */
public class FileOperate {
	public FileOperate() {
	}
	/**
	 * 新建目录
	 * @param folderPath String 如 c:/fqf
	 * @return boolean
	 * @throws Exception 
	 */
	public boolean newFolder(String folderPath) throws Exception {
		boolean iSucess = false;
		File myFilePath = null;
		try {
			String filePath = folderPath;
			myFilePath = new File(filePath);
			if (!myFilePath.exists()) {
				if (myFilePath.mkdirs())
					iSucess = true;
			}else{
				iSucess = true;
			}
		} catch (Exception e) {
			System.out.println("新建目录操作出错");
			throw e;
		}finally{
		}
		return iSucess;
	}

	/**
	 * 新建文件
	 * @param filePathAndName String 文件路径及名称 如c:/fqf.txt
	 * @param fileContent String 文件内容
	 * @return boolean
	 * @throws IOException 
	 */
	public boolean newFile(String filePathAndName, String fileContent) throws IOException {
		FileWriter fileWriter = null;
		BufferedWriter bfW =null;
		try {   
	    	fileWriter = new FileWriter(filePathAndName);   
	        bfW = new BufferedWriter(fileWriter);  
	        bfW.write(fileContent);	 
	        bfW.flush();
    	} catch (IOException e) { 
    		System.out.println("新建文件操作出错");
            throw e;
        } finally{
        	if(bfW != null){
        		bfW.close();
        		bfW = null;
        	}
        	if(fileWriter != null){
        		fileWriter.close();
        		fileWriter = null;
        	}
        }
		return true;
	}
	/**
	 * 删除文件
	 * @param filePathAndName String 文件路径及名称 如c:/fqf.txt
	 * @param fileContent String
	 * @return boolean
	 */
	public void delFile(String filePathAndName) {
		try {
			String filePath = filePathAndName;
			filePath = filePath.toString();
			File myDelFile = new File(filePath);
			myDelFile.delete();
		} catch (Exception e) {
			System.out.println("删除文件操作出错");
			e.printStackTrace();
		}
	}
	/**
	 * 删除文件夹
	 * @param filePathAndName String 文件夹路径及名称 如c:/fqf
	 * @param fileContent String
	 * @return boolean
	 */
	public void delFolder(String folderPath) {
		try {
			delAllFile(folderPath); // 删除完里面所有内容
			String filePath = folderPath;
			filePath = filePath.toString();
			File myFilePath = new File(filePath);
			myFilePath.delete(); // 删除空文件夹
		} catch (Exception e) {
			System.out.println("删除文件夹操作出错");
			e.printStackTrace();
		}
	}

	/**
	 * 删除文件夹里面的所有文件
	 * 
	 * @param path
	 *            String 文件夹路径 如 c:/fqf
	 */
	public void delAllFile(String path) {
		File file = new File(path);
		if (!file.exists()) {
			return;
		}
		if (!file.isDirectory()) {
			return;
		}
		String[] tempList = file.list();
		File temp = null;
		for (int i = 0; i < tempList.length; i++) {
			if (path.endsWith(File.separator)) {
				temp = new File(path + tempList[i]);
			} else {
				temp = new File(path + File.separator + tempList[i]);
			}
			if (temp.isFile()) {
				temp.delete();
			}
			if (temp.isDirectory()) {
				delAllFile(path + "/" + tempList[i]);// 先删除文件夹里面的文件
				delFolder(path + "/" + tempList[i]);// 再删除空文件夹
			}
		}
	}

	/**
	 * 复制单个文件
	 * @param oldPath String 原文件路径 如：c:/fqf.txt
	 * @param newPath String 复制后路径 如：f:/fqf.txt
	 * @return boolean
	 */
	public void copyFile(String oldPath, String newPath) {
		InputStream inStream = null;
		FileOutputStream fs = null;
		try {
			int bytesum = 0;
			int byteread = 0;
			File oldfile = new File(oldPath);
			if (oldfile.exists()) { // 文件存在时
				inStream = new FileInputStream(oldPath); // 读入原文件
				fs = new FileOutputStream(newPath);
				byte[] buffer = new byte[1444];
				while ((byteread = inStream.read(buffer)) != -1) {
					bytesum += byteread; // 字节数 文件大小
					System.out.println(bytesum);
					fs.write(buffer, 0, byteread);
				}
				inStream.close();
			}
		} catch (Exception e) {
			System.out.println("复制单个文件操作出错");
			e.printStackTrace();
		}finally{
			if(fs != null){
				try {
					fs.flush();
					fs.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				fs = null;
			}
			if(inStream != null){
				try {
					inStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				inStream = null;
			}
		}

	}

	/**
	 * 复制整个文件夹内容
	 * @param oldPath String 原文件路径 如：c:/fqf
	 * @param newPath String 复制后路径 如：f:/fqf/ff
	 * @return boolean
	 */
	public void copyFolder(String oldPath, String newPath) {
		FileInputStream input = null;
		FileOutputStream output = null;
		try {
			(new File(newPath)).mkdirs(); // 如果文件夹不存在 则建立新文件夹
			File a = new File(oldPath);
			String[] file = a.list();
			File temp = null;
			for (int i = 0; i < file.length; i++) {
				if (oldPath.endsWith(File.separator)) {
					temp = new File(oldPath + file[i]);
				} else {
					temp = new File(oldPath + File.separator + file[i]);
				}

				if (temp.isFile()) {
					input = new FileInputStream(temp);
					output = new FileOutputStream(newPath + "/" + (temp.getName()).toString());
					byte[] b = new byte[1024 * 5];
					int len;
					while ((len = input.read(b)) != -1) {
						output.write(b, 0, len);
					}
					output.flush();
					output.close();
					input.close();
				}
				if (temp.isDirectory()) {// 如果是子文件夹
					copyFolder(oldPath + "/" + file[i], newPath + "/" + file[i]);
				}
			}
		} catch (Exception e) {
			System.out.println("复制整个文件夹内容操作出错");
			e.printStackTrace();
		}finally{
			if(output != null){
				try{
					output.flush();
					output.close();
				}catch(IOException e){
					e.printStackTrace();
				}
				output = null;
			}
			if(input != null){
				try{
					input.close();
				}catch(IOException e){
					e.printStackTrace();
				}
				input = null;
			}
		}

	}

	public List<String> GetListFileName(String path) {
		File parentFile = new File(path);
		File[] childrenFile = parentFile.listFiles();
		ArrayList<String> txtFile = new ArrayList<String>();
		if (childrenFile != null && childrenFile.length > 0) {
			for (int i = 0; i < childrenFile.length; i++) {
				if (childrenFile[i].getName().endsWith(".txt") || childrenFile[i].getName().endsWith(".min"))
					txtFile.add(childrenFile[i].toString());
			}
		}
		return txtFile;
	}
	/**
	 * 读取目录下的文件列表中的内容
	 * @param fileList 例如：C:/IP下的所有.TXT
	 * @return
	 */
	public List<String> ReadFileList(List<String> fileList) {
		int count = 0;
		List<String> listContent = new ArrayList<String>();
		FileReader read = null;
		for (String file : fileList) {
			count++;
			try {
				read = new FileReader(new File(file));
				StringBuffer sb = new StringBuffer();
				char ch[] = new char[1024 * 1024];
				int d = read.read(ch);
				while (d != -1) {
					String str = new String(ch, 0, d);
					sb.append(str);
					d = read.read(ch);
					System.out.println(sb);
					listContent.add(sb.toString());
				}
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} finally{
				if(read != null){
					try{
						read.close();
					}catch(IOException e){
						e.printStackTrace();
					}
					read = null;
				}
			}
		}
		return listContent;
	}

	/**
	 * 移动文件到指定目录
	 * 
	 * @param oldPath
	 *            String 如：c:/fqf.txt
	 * @param newPath
	 *            String 如：d:/fqf.txt
	 */
	public void moveFile(String oldPath, String newPath) {
		copyFile(oldPath, newPath);
		delFile(oldPath);
	}

	/**
	 * 移动文件到指定目录
	 * 
	 * @param oldPath
	 *            String 如：c:/fqf.txt
	 * @param newPath
	 *            String 如：d:/fqf.txt
	 */
	public void moveFolder(String oldPath, String newPath) {
		copyFolder(oldPath, newPath);
		// delFolder(oldPath);
	}

	public static void main(String[] args) {
//		FileOperate oper = new FileOperate();
//		oper.moveFolder("E:/IP", "E:/Oracle10G/ipconfig");
//		oper.newFolder("dayData/sendFile/"+Common.df7.format(Common.getDate()));
		String path="D:/aaa.txt";
		String str="ssssssssssljkss\ndddddddddddpijpddddddd\nsssssuyuugggsssssssssss\neeeeeeeeee";
		FileOperate fo = new FileOperate();
		try {
			fo.newFile(path,str);
			//path="D:/修改文档/后台0703.rar";
			File ff = new File(path);
			System.out.println(str.length()+"   "+ff.length());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
